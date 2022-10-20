import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/cloud_functions/cloud_functions.dart';
import '../flutter_flow/flutter_flow_mux_broadcast.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BroadcastPageWidget extends StatefulWidget {
  const BroadcastPageWidget({
    Key? key,
    this.videoName,
  }) : super(key: key);

  final String? videoName;

  @override
  _BroadcastPageWidgetState createState() => _BroadcastPageWidgetState();
}

class _BroadcastPageWidgetState extends State<BroadcastPageWidget> {
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  bool _isSupportedPlatform = false;
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;
  StreamsRecord? muxStreamOutput;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BroadcastPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    Wakelock.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'BroadcastPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Broadcast',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FlutterFlowMuxBroadcast(
                      isCameraInitialized: _isCameraInitialized,
                      isStreaming: muxBroadcastIsLive,
                      durationString: _durationString,
                      borderRadius: BorderRadius.circular(0),
                      controller: muxBroadcastController,
                      videoConfig: _initialVideoConfig,
                      onCameraRotateButtonTap: () async {
                        await switchCamera();
                        setState(
                            () => _isFrontCamSelected = !_isFrontCamSelected);
                      },
                      startButtonText: 'Start Stream',
                      startButtonIcon: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      startButtonOptions: FFButtonOptions(
                        width: 160,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      liveIcon: FaIcon(
                        FontAwesomeIcons.solidCircle,
                        color: Colors.red,
                        size: 10,
                      ),
                      liveText: 'Live',
                      liveTextStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.red,
                              ),
                      liveTextBackgroundColor: Color(0x8A000000),
                      durationTextStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.red,
                              ),
                      durationTextBackgroundColor: Color(0x8A000000),
                      liveContainerBorderRadius: BorderRadius.circular(8),
                      durationContainerBorderRadius: BorderRadius.circular(8),
                      rotateButtonColor: Color(0x8A000000),
                      rotateButtonIcon: Icon(
                        Icons.flip_camera_android,
                        color: Colors.white,
                        size: 24,
                      ),
                      stopButtonIcon: Icon(
                        Icons.stop_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      stopButtonColor: Colors.red,
                      onStartButtonTap: () async {
                        await startStreaming();
                        logFirebaseEvent(
                            'BROADCAST_MuxBroadcast_arjcssw3_ON_MUX_B');
                        logFirebaseEvent('MuxBroadcast_backend_call');

                        final streamsCreateData = createStreamsRecordData(
                          isLive: true,
                          playbackName: widget.videoName,
                          playbackUrl: muxBroadcastPlaybackUrl,
                          timestamp: getCurrentTimestamp,
                          uid: currentUserUid,
                        );
                        var streamsRecordReference =
                            StreamsRecord.collection.doc();
                        await streamsRecordReference.set(streamsCreateData);
                        muxStreamOutput = StreamsRecord.getDocumentFromData(
                            streamsCreateData, streamsRecordReference);

                        setState(() {});
                      },
                      onStopButtonTap: () async {
                        stopStreaming();
                        logFirebaseEvent(
                            'BROADCAST_MuxBroadcast_arjcssw3_ON_MUX_B');
                        logFirebaseEvent('MuxBroadcast_backend_call');

                        final streamsUpdateData = createStreamsRecordData(
                          isLive: false,
                        );
                        await muxStreamOutput!.reference
                            .update(streamsUpdateData);
                        logFirebaseEvent('MuxBroadcast_navigate_back');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response = await makeCloudCall(callName, {});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        Wakelock.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      Wakelock.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}


import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:digital_consulting_platform/pages/agora_page/app_brain.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class VoiceCallScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VoiceCallScreen();
  }

}
class _VoiceCallScreen extends State<VoiceCallScreen>{
  late int _remoteUid =0;
  late RtcEngine _engine ;

  @override
  void initState() {
   initAgora();
    super.initState();
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
           color: Colors.black87 ,
           child: Center(
             child: _remoteUid ==0
             ? Text('Calling...', style: TextStyle(color: Colors.white),)
             : Text('Calling with $_remoteUid'),
           ),
         ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 25,right: 25),
              child:
              Container(
                height: 50,
                color: Colors.black12,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop(true);
                    }, icon: Icon(
                      Icons.call_end,
                      size: 44,
                      color: Colors.redAccent,
                    ))
                  ],
                ),
              )


            ),
          )
        ],
      ),
    );
  }


  Future<void> initAgora() async {
    await [Permission.microphone].request();
    _engine = await RtcEngine.create(AgoraManager.appId);
    _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid , int elapsed){
          print('local user $uid joined successfully');
        },
        userJoined: (int uid , int elapsed){
          print('remote user $uid joined successfully');
          setState(() {
            _remoteUid = uid;
          });
    },
        userOffline: (int uid , UserOfflineReason reason){
          print('remote user $uid left call');
          setState(() {
            _remoteUid = 0;
          });
          Navigator.of(context).pop(true);
        },


      )
    );
    await _engine.joinChannel(AgoraManager.token, AgoraManager.channelName, null, 0);

  }

  // Widget _renderLocalPreview(){
  //   return RtcLocalView.SurfaceView();
  // }
  // Widget _renderRemoteVideo (){
  //   if(_remoteUid !=0){
  //     return RtcRemoteView.SurfaceView(
  //       uid : _remoteUid
  //     );
  //   }else {
  //     return Text('Calling...',
  //     style: Theme.of(context).textTheme.headline6,
  //       textAlign: TextAlign.center,
  //     );
  //   }
  // }

}
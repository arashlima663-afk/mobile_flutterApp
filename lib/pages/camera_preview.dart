import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/camera/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera/bloc.dart';

class CameraView extends StatefulWidget {
  final CameraController? controller;
  final Size size;

  const CameraView({super.key, required this.controller, required this.size});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    FlashMode? currentFlashMode;
    currentFlashMode = widget.controller!.value.flashMode;

    return Stack(
      children: [
        widget.controller != null && widget.controller!.value.isInitialized
            ? SizedBox(
              height: widget.size.height* 2 / 3,
              width: widget.size.width,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(width: state.controller!.value.previewSize!.height,
            height: widget.controller!.value.previewSize!.width,
                    child: Stack(fit: StackFit.expand,
                      children: [
                        CameraPreview(widget.controller!),
                        Column(mainAxisSize: MainAxisSize.min,children: [GestureDetector(
                      onTap: () {
                        context.read<PictureBloc>().add(ChangeFlash());
                      },
                      child: currentFlashMode == FlashMode.always
                          ? const Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: 40,
                            )
                          : const Icon(
                              Icons.flash_off,
                              color: Colors.white,
                              size: 40,
                            ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        bool backCamera =
                            context
                                    .read<PictureBloc>()
                                    .state
                                    .backCamera!
                            ? false
                            : true;
                    
                        context.read<PictureBloc>().add(PictureInit(backCamera));
                      },
                      child: const Icon(
                        Icons.change_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),]),
                       
                        Positioned(
                          bottom: 14,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () =>
                                  context.read<PictureBloc>().add(PictureTaken()),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Text('No Camera available'),

        
      ],
    );
  }
}



// return Stack(
//       children: [
//         widget.controller != null && widget.controller!.value.isInitialized
//             ? Transform.scale(
//                 alignment: Alignment.topCenter,
//                 scaleY: 0.90,
//                 child: Stack(
//                   children: [
//                     CameraPreview(widget.controller!),
//                     Positioned(
//                       bottom: 14,
//                       left: 0,
//                       right: 0,
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () =>
//                               context.read<PictureBloc>().add(PictureTaken()),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : const Text('No Camera available'),

//         Align(
//           alignment: Alignment.topRight,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 5, top: 10),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     context.read<PictureBloc>().add(ChangeFlash());
//                   },
//                   child: currentFlashMode == FlashMode.always
//                       ? const Icon(
//                           Icons.flash_on,
//                           color: Colors.white,
//                           size: 40,
//                         )
//                       : const Icon(
//                           Icons.flash_off,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                 ),
//                 const SizedBox(height: 15),
//                 GestureDetector(
//                   onTap: () {
//                     dynamic boolianguy =
//                         context
//                                 .read<PictureBloc>()
//                                 .state
//                                 .controller!
//                                 .description
//                                 .lensDirection ==
//                             CameraLensDirection.back
//                         ? false
//                         : true;

//                     context.read<PictureBloc>().add(PictureInit(boolianguy));
//                   },
//                   child: const Icon(
//                     Icons.change_circle,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
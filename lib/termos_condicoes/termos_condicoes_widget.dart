import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termos_condicoes_model.dart';
export 'termos_condicoes_model.dart';

class TermosCondicoesWidget extends StatefulWidget {
  const TermosCondicoesWidget({super.key});

  @override
  _TermosCondicoesWidgetState createState() => _TermosCondicoesWidgetState();
}

class _TermosCondicoesWidgetState extends State<TermosCondicoesWidget> {
  late TermosCondicoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosCondicoesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.00, 0.00),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 36.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          width: 266.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'Termos e condições',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Eget felis eget nunc lobortis mattis. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Nec nam aliquam sem et tortor consequat id porta nibh. Neque gravida in fermentum et sollicitudin ac orci. Et ultrices neque ornare aenean euismod elementum nisi quis. Aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices. Quam lacus suspendisse faucibus interdum posuere. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Vestibulum rhoncus est pellentesque elit. Nam at lectus urna duis convallis convallis. Risus viverra adipiscing at in tellus integer feugiat. Arcu ac tortor dignissim convallis aenean et. Montes nascetur ridiculus mus mauris vitae. Ut sem nulla pharetra diam sit amet nisl. Suspendisse faucibus interdum posuere lorem ipsum dolor sit. Vel pretium lectus quam id leo in vitae.\n\nEget mauris pharetra et ultrices neque ornare aenean euismod. Tortor id aliquet lectus proin nibh nisl condimentum id venenatis. Cras sed felis eget velit aliquet. Massa sed elementum tempus egestas. Odio euismod lacinia at quis. Gravida rutrum quisque non tellus orci ac auctor augue mauris. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum. Donec massa sapien faucibus et molestie ac feugiat sed lectus. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at augue. Eget arcu dictum varius duis at consectetur lorem. Purus in massa tempor nec feugiat nisl. Nulla at volutpat diam ut. Faucibus nisl tincidunt eget nullam non nisi est sit. Metus aliquam eleifend mi in nulla posuere. Non odio euismod lacinia at quis risus sed. Aenean pharetra magna ac placerat vestibulum lectus mauris. Quisque sagittis purus sit amet volutpat consequat mauris nunc congue. Massa tempor nec feugiat nisl pretium.\n\nUt tellus elementum sagittis vitae et leo. Tortor vitae purus faucibus ornare suspendisse sed nisi. Mus mauris vitae ultricies leo integer malesuada nunc. Et netus et malesuada fames ac turpis egestas maecenas pharetra. Tincidunt arcu non sodales neque sodales. Risus sed vulputate odio ut enim blandit volutpat maecenas. Nec dui nunc mattis enim. Adipiscing enim eu turpis egestas. Id leo in vitae turpis. Vitae turpis massa sed elementum tempus egestas. Commodo sed egestas egestas fringilla phasellus. Eu lobortis elementum nibh tellus molestie. Ac turpis egestas maecenas pharetra convallis posuere morbi leo. Vestibulum sed arcu non odio euismod lacinia at. Diam donec adipiscing tristique risus nec feugiat in. Imperdiet proin fermentum leo vel. Felis donec et odio pellentesque diam volutpat commodo. Egestas pretium aenean pharetra magna ac. Justo laoreet sit amet cursus sit amet dictum. Morbi tristique senectus et netus.\n\nSit amet nisl purus in mollis nunc. Ut enim blandit volutpat maecenas volutpat blandit. Ornare arcu dui vivamus arcu felis bibendum ut tristique et. Vitae congue mauris rhoncus aenean vel. Ut eu sem integer vitae justo. Massa massa ultricies mi quis hendrerit dolor. Amet cursus sit amet dictum. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at augue. Vitae justo eget magna fermentum iaculis eu non diam. Fusce ut placerat orci nulla pellentesque. Dis parturient montes nascetur ridiculus. Amet aliquam id diam maecenas.\n\nQuis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Amet commodo nulla facilisi nullam vehicula ipsum a arcu. Ac tortor vitae purus faucibus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Ornare arcu odio ut sem nulla pharetra diam sit. Tempus imperdiet nulla malesuada pellentesque elit eget. Ac felis donec et odio pellentesque diam volutpat. Tristique nulla aliquet enim tortor at auctor urna nunc. Egestas dui id ornare arcu odio ut sem. Morbi enim nunc faucibus a pellentesque sit. Commodo elit at imperdiet dui accumsan sit.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

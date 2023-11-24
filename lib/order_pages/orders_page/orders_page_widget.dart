import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/order_comp/order_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_page_model.dart';
export 'orders_page_model.dart';

class OrdersPageWidget extends StatefulWidget {
  const OrdersPageWidget({super.key});

  @override
  _OrdersPageWidgetState createState() => _OrdersPageWidgetState();
}

class _OrdersPageWidgetState extends State<OrdersPageWidget> {
  late OrdersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersPageModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          width: 266.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'Pedidos',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<OrdersRecord>>(
                          stream: queryOrdersRecord(
                            queryBuilder: (ordersRecord) => ordersRecord
                                .whereNotIn(
                                    'order_Status', FFAppState().stautsList)
                                .where(
                                  'user_ref',
                                  isEqualTo: currentUserReference,
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<OrdersRecord> columnOrdersRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnOrdersRecordList.length, (columnIndex) {
                                final columnOrdersRecord =
                                    columnOrdersRecordList[columnIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.orderCompModels1.getModel(
                                          columnOrdersRecord.reference.id,
                                          columnIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: OrderCompWidget(
                                          key: Key(
                                            'Key08j_${columnOrdersRecord.reference.id}',
                                          ),
                                          orderNumber:
                                              columnOrdersRecord.orderNumber,
                                          orderValue:
                                              columnOrdersRecord.orderValue,
                                          orderStatus:
                                              columnOrdersRecord.orderStatus,
                                          placingTime: columnOrdersRecord
                                              .orderCreatedTime!,
                                          orderRef:
                                              columnOrdersRecord.reference,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Histórico',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        StreamBuilder<List<OrdersRecord>>(
                          stream: queryOrdersRecord(
                            queryBuilder: (ordersRecord) => ordersRecord
                                .whereIn(
                                    'order_Status', FFAppState().stautsList)
                                .where(
                                  'user_ref',
                                  isEqualTo: currentUserReference,
                                )
                                .orderBy('order_created_time',
                                    descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<OrdersRecord> columnOrdersRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnOrdersRecordList.length, (columnIndex) {
                                final columnOrdersRecord =
                                    columnOrdersRecordList[columnIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.orderCompModels2.getModel(
                                          columnOrdersRecord.reference.id,
                                          columnIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: OrderCompWidget(
                                          key: Key(
                                            'Keyfcr_${columnOrdersRecord.reference.id}',
                                          ),
                                          orderNumber:
                                              columnOrdersRecord.orderNumber,
                                          orderValue:
                                              columnOrdersRecord.orderValue,
                                          orderStatus:
                                              columnOrdersRecord.orderStatus,
                                          placingTime: columnOrdersRecord
                                              .orderCreatedTime!,
                                          orderRef:
                                              columnOrdersRecord.reference,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 60.0,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            hoverColor: const Color(0xFFFF7700),
                            icon: const FaIcon(
                              FontAwesomeIcons.home,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('HomePage');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 60.0,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            hoverColor: const Color(0xFFFF7700),
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('searchPage');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 60.0,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            hoverColor: const Color(0xFFFF7700),
                            icon: const FaIcon(
                              FontAwesomeIcons.cartPlus,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('cart');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 60.0,
                            fillColor: const Color(0xFFFF7700),
                            hoverColor: const Color(0xFFFF7700),
                            icon: const FaIcon(
                              FontAwesomeIcons.thList,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('ordersPage');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 60.0,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            hoverColor: const Color(0xFFFF7700),
                            icon: const Icon(
                              Icons.account_circle_sharp,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('profile');
                            },
                          ),
                        ].divide(const SizedBox(width: 40.0)),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

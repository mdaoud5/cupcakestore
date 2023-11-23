import '/backend/backend.dart';
import '/components/order_comp/order_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<OrdersRecord>>(
                        stream: queryOrdersRecord(
                          queryBuilder: (ordersRecord) =>
                              ordersRecord.whereNotIn(
                                  'order_Status', FFAppState().stautsList),
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
                                        orderRef: columnOrdersRecord.reference,
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
                              .whereIn('order_Status', FFAppState().stautsList)
                              .orderBy('order_created_time', descending: true),
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
                                        orderRef: columnOrdersRecord.reference,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

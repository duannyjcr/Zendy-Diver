import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/my_order_item/my_order_item_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_order_model.dart';
export 'my_order_model.dart';

class MyOrderWidget extends StatefulWidget {
  const MyOrderWidget({super.key});

  static String routeName = 'MyOrder';
  static String routePath = '/myOrder';

  @override
  State<MyOrderWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<MyOrderWidget>
    with TickerProviderStateMixin {
  late MyOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOrderModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .fontStyle,
                                      ),
                                  unselectedLabelStyle: TextStyle(),
                                  labelColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context).black3,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  unselectedBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  elevation: 0.0,
                                  buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  padding: EdgeInsets.all(4.0),
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '5dnqugbt' /* My Order */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '42hehwip' /* History */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    StreamBuilder<List<DeliveryRecord>>(
                                      stream: queryDeliveryRecord(
                                        queryBuilder: (deliveryRecord) =>
                                            deliveryRecord
                                                .where(
                                                  'id_user_customer',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .whereIn(
                                                    'status',
                                                    DeliveryStatus.values
                                                        .where((e) =>
                                                            (e == DeliveryStatus.pending) ||
                                                            (e ==
                                                                DeliveryStatus
                                                                    .assigned) ||
                                                            (e ==
                                                                DeliveryStatus
                                                                    .collected) ||
                                                            (e ==
                                                                DeliveryStatus
                                                                    .paid))
                                                        .toList()
                                                        .map((e) =>
                                                            e.serialize())
                                                        .toList()),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitFadingGrid(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DeliveryRecord>
                                            listViewDeliveryRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewDeliveryRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 2.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDeliveryRecord =
                                                listViewDeliveryRecordList[
                                                    listViewIndex];
                                            return MyOrderItemWidget(
                                              key: Key(
                                                  'Keykrq_${listViewIndex}_of_${listViewDeliveryRecordList.length}'),
                                              price:
                                                  listViewDeliveryRecord.price,
                                              status: listViewDeliveryRecord
                                                  .status!,
                                              date: listViewDeliveryRecord
                                                  .createDate!,
                                              tag: listViewDeliveryRecord.tag,
                                              idDelivery: listViewDeliveryRecord
                                                  .reference,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<DeliveryRecord>>(
                                      stream: queryDeliveryRecord(
                                        queryBuilder: (deliveryRecord) =>
                                            deliveryRecord
                                                .where(
                                                  'id_user_customer',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .whereIn(
                                                    'status',
                                                    DeliveryStatus.values
                                                        .where((e) =>
                                                            (e ==
                                                                DeliveryStatus
                                                                    .completed) ||
                                                            (e ==
                                                                DeliveryStatus
                                                                    .canceled))
                                                        .toList()
                                                        .map((e) =>
                                                            e.serialize())
                                                        .toList()),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitFadingGrid(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DeliveryRecord>
                                            listViewDeliveryRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewDeliveryRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDeliveryRecord =
                                                listViewDeliveryRecordList[
                                                    listViewIndex];
                                            return wrapWithModel(
                                              model: _model.myOrderItemModels2
                                                  .getModel(
                                                listViewDeliveryRecord
                                                    .createDate!
                                                    .toString(),
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MyOrderItemWidget(
                                                key: Key(
                                                  'Key9d4_${listViewDeliveryRecord.createDate!.toString()}',
                                                ),
                                                price: listViewDeliveryRecord
                                                    .price,
                                                status: listViewDeliveryRecord
                                                    .status!,
                                                date: listViewDeliveryRecord
                                                    .createDate!,
                                                tag: listViewDeliveryRecord.tag,
                                                idDelivery:
                                                    listViewDeliveryRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].addToStart(SizedBox(height: 30.0)),
                    ),
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

import 'package:sks/helper/app_export.dart';

class BookingDetailsController extends GetxController {
  BookingsDatum booking = BookingsDatum();
  late Color statusTextColor;
  List shippingDetails = [
    'POL',
    'POD',
    'Commodity',
    'Container Quantity',
    'Size/Type',
    'Vessel/Voyage',
    'Payable at POL',
    'Additional Charges',
    'POD Tariff',
    'Forwarder',
    'Line Code',
    'Buying',
    'Trade',
    'Export/Import',
    'Status',
    'Special Instructions',
  ];

  List shippingDesc = [];
  List companyDesc = [];

  List companyDetails = [
    'Shipper Name',
    'Shipper Organization',
    'Clearing Agent',
    'Marketing Person',
    'Email Address',
    'Contact No.'
  ];

  @override
  void onInit() {
    booking = Get.arguments;

    shippingDesc = [];
    shippingDesc.add("${booking.pol}");
    shippingDesc.add("${booking.pod}");
    shippingDesc.add("${booking.commodity}");
    shippingDesc.add("${booking.containerQuantity}");
    shippingDesc.add("${booking.sizeOrType}");
    shippingDesc.add("${booking.vessel}");
    shippingDesc.add("${booking.payableAtPol}");
    shippingDesc.add("${booking.additionalCharges}");
    shippingDesc.add("${booking.podTeriff}");
    shippingDesc.add("${booking.forwarder}");
    shippingDesc.add("${booking.lineCode}");
    shippingDesc.add("${booking.buying}");
    shippingDesc.add("${booking.trade}");
    shippingDesc.add("${booking.importOrExport}");
    shippingDesc.add("${booking.approvalStatus}");
    shippingDesc.add("${booking.instructions}");

    companyDesc = [];
    companyDesc.add("${booking.shipper}");
    companyDesc.add("${booking.shipperOrganization}");
    companyDesc.add("${booking.clearingAgent}");
    companyDesc.add("${booking.marketingPerson}");
    companyDesc.add("${booking.emailAddress}");
    companyDesc.add("${booking.contactno}");
    statusTextColor = booking.statusTxtColor!;
    // TODO: implement onInit
    super.onInit();
  }
}

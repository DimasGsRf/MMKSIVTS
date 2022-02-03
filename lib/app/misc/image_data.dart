import 'package:soid_mobile/app/misc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageData {
  late String imgBarcode;
  late String imgSalesmanCustomer;
  late String imgServiceBook;
  late String imgMyMitsubishi;

  ImageData() {
    this.loadData();
  }

  void stageImageToSharedPreferences(String barcode, String salesmanCustomer,
      String serviceBook, String myMitsubishi) {
    this.imgBarcode = barcode;
    this.imgSalesmanCustomer = salesmanCustomer;
    this.imgServiceBook = serviceBook;
    this.imgMyMitsubishi = myMitsubishi;
  }

  void loadData() {
    this._getSharedPreferences().then((sp) {
      this.imgBarcode = sp.getString(AppConstants.IMAGE_DATA_BARCODE) ?? "";
      this.imgSalesmanCustomer =
          sp.getString(AppConstants.IMAGE_DATA_SALESMAN_CUSTOMER) ?? "";
      this.imgServiceBook =
          sp.getString(AppConstants.IMAGE_DATA_SERVICE_BOOK) ?? "";
      this.imgMyMitsubishi =
          sp.getString(AppConstants.IMAGE_DATA_MY_MITSUBISHI) ?? "";
    });
  }

  void clear() {
    this._getSharedPreferences().then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences().then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.imgBarcode = "";
    this.imgSalesmanCustomer = "";
    this.imgServiceBook = "";
    this.imgMyMitsubishi = "";
  }

  void clearImageData() {
    clearProperties();
    save();
  }

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setString(AppConstants.IMAGE_DATA_BARCODE, this.imgBarcode);
      sp.setString(AppConstants.IMAGE_DATA_SERVICE_BOOK, this.imgServiceBook);
      sp.setString(AppConstants.IMAGE_DATA_MY_MITSUBISHI, this.imgMyMitsubishi);
      sp.setString(
        AppConstants.IMAGE_DATA_SALESMAN_CUSTOMER,
        this.imgSalesmanCustomer,
      );
    });
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}

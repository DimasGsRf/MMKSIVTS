// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static Future<S> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }

  String get app_name {
    return Intl.message("SALES FORCE ID", name: 'app_name');
  }

  String get app_info_description_1 {
    return Intl.message(
        "Mitsubishi Sales Force ID adalah aplikasi dari PT. Mitsubishi Motors Krama Yudha Sales Indonesia yang memberikan informasi seputar produk dan informasi  lainnya mengenai penjualan kendaraan Mitsubishi Motors yang perlu diketahui oleh tenaga penjual untuk membantu proses penjualan.",
        name: 'app_info_description_1');
  }

  String get app_info_description_2 {
    return Intl.message(
        "Tenaga Penjualan juga mampu melakukan pelaporan pengiriman kendaraan kepada konsumen melalui fitur PKT untuk meningkatkan kualitas layanan pada konsumen",
        name: 'app_info_description_2');
  }

  String get otp_not_received {
    return Intl.message("Tidak Menerima Kode?", name: 'otp_not_received');
  }

  String get otp_resend {
    return Intl.message("Kirim Ulang", name: 'otp_resend');
  }

  String otp_information(phone, email) {
    return Intl.message(
        "Masukkan Kode Verifikasi yang telah dikirimkan ke <b>${phone}<b/> dan email ${email}",
        name: 'otp_information',
        args: [phone, email]);
  }

  String get otp_app_bar_title {
    return Intl.message("Verifikasi Akun", name: 'otp_app_bar_title');
  }

  String get otp_form_description {
    return Intl.message("Masukkan Kode Verifikasi yang telah dikirimkan ke ",
        name: 'otp_form_description');
  }

  String get login_forgot {
    return Intl.message("Lupa Password?", name: 'login_forgot');
  }

  String get login_wrong_password {
    return Intl.message("Password Salah", name: 'login_wrong_password');
  }

  String get login_help_title {
    return Intl.message("Bagaimana Anda Dapat Masuk Ke Aplikasi SFID?",
        name: 'login_help_title');
  }

  String get login_help_content {
    return Intl.message(
        "1.     Masukkan Kode Sales (Contoh: S-123456)\n\n2. Masukkan Kode Dealer pada kolom password (Contoh: 100999)\n\n\nJika anda belum dapat melakukan aktivasi harap segera melapor ke Admin Dealer agar bisa dilakukan pengecekan terutama di D-Net.",
        name: 'login_help_content');
  }

  String get privacy_page_title {
    return Intl.message("Kebijakan Privacy", name: 'privacy_page_title');
  }

  String get privacy_page_subtitle {
    return Intl.message("Kebijakan Privacy untuk \nAplikasi Sales Force ID",
        name: 'privacy_page_subtitle');
  }

  String get privacy_button_close_label {
    return Intl.message("Ini bukan akun saya",
        name: 'privacy_button_close_label');
  }

  String get privacy_content_title {
    return Intl.message("Bagian 1 End User License Agreement \n (\"EULA\")",
        name: 'privacy_content_title');
  }

  String get forgot_password_success_content {
    return Intl.message("Password baru telah dikirim ke email dan nomor Ponsel",
        name: 'forgot_password_success_content');
  }

  String home_greeting(sales) {
    return Intl.message("Hello, ${sales}",
        name: 'home_greeting', args: [sales]);
  }

  String get eksternal_link {
    return Intl.message("Eksternal Link", name: 'eksternal_link');
  }

  String get home_welcome_title {
    return Intl.message("Silahkan pilih salah satu menu",
        name: 'home_welcome_title');
  }

  String get home_menu_training_material_label {
    return Intl.message("Training\nMaterial",
        name: 'home_menu_training_material_label');
  }

  String get home_menu_quick_guide_label {
    return Intl.message("Quick\nGuide", name: 'home_menu_quick_guide_label');
  }

  String get home_menu_bulletin_label {
    return Intl.message("Salesman\nBulletin", name: 'home_menu_bulletin_label');
  }

  String get home_menu_additional_info_label {
    return Intl.message("Additional\nInfo",
        name: 'home_menu_additional_info_label');
  }

  String get home_menu_contact_customer_label {
    return Intl.message("Contact &\nCustomer",
        name: 'home_menu_contact_customer_label');
  }

  String get home_menu_spk_tracking_label {
    return Intl.message("SPK\nTracking", name: 'home_menu_spk_tracking_label');
  }

  String get home_menu_pdi_warranty_label {
    return Intl.message("PDI &\nWarranty",
        name: 'home_menu_pdi_warranty_label');
  }

  String get home_menu_pkt_submmission_label {
    return Intl.message("PKT\nSubmission",
        name: 'home_menu_pkt_submmission_label');
  }

  String get home_menu_e_learning_label {
    return Intl.message("E-Learning", name: 'home_menu_e_learning_label');
  }

  String get home_menu_catalog_label {
    return Intl.message("Catalog", name: 'home_menu_catalog_label');
  }

  String get home_menu_recommendation_label {
    return Intl.message("Rekomendasi", name: 'home_menu_recommendation_label');
  }

  String get home_news_title {
    return Intl.message("Terbaru dari MMKSI", name: 'home_news_title');
  }

  String get home_dialog_tutorial_title {
    return Intl.message(
        "Nikmati pengalaman meningkatkan kualitas diri dengan SFID",
        name: 'home_dialog_tutorial_title');
  }

  String get home_dialog_tutorial_content {
    return Intl.message(
        "Gunakan berbagai fitur aplikasi SFID untuk membantu kinerja penjualan anda. Pelajari berbagai fungsi aplikasi yang dapat anda maksimalkan untuk memenangkan hati konsumen.",
        name: 'home_dialog_tutorial_content');
  }

  String get home_dialog_tutorial_button {
    return Intl.message("TUTORIAL SFID", name: 'home_dialog_tutorial_button');
  }

  String get tutorial_title {
    return Intl.message("Tutorial", name: 'tutorial_title');
  }

  String get input_placeholder_sales_code {
    return Intl.message("Sales Code", name: 'input_placeholder_sales_code');
  }

  String get input_placeholder_sales_name {
    return Intl.message("Nama Sales", name: 'input_placeholder_sales_name');
  }

  String get input_placeholder_password {
    return Intl.message("Password", name: 'input_placeholder_password');
  }

  String get input_sales_code {
    return Intl.message("Masukkan Sales Code Anda", name: 'input_sales_code');
  }

  String get register_app_title {
    return Intl.message("Aktifkan Akun", name: 'register_app_title');
  }

  String get register_instruction {
    return Intl.message(
        "Silakan masukkan e-mail, nomor Ponsel dan password baru untuk dapat mengaktifkan akun anda.",
        name: 'register_instruction');
  }

  String get register_email_input {
    return Intl.message("Email Anda", name: 'register_email_input');
  }

  String get register_phone_input {
    return Intl.message("Nomor Ponsel", name: 'register_phone_input');
  }

  String get register_password_input {
    return Intl.message("Password Baru", name: 'register_password_input');
  }

  String get register_confirm_input {
    return Intl.message("Konfirmasi Password Baru",
        name: 'register_confirm_input');
  }

  String get register_submit_button {
    return Intl.message("Dapatkan Kode OTP", name: 'register_submit_button');
  }

  String get register_error_email_invalid {
    return Intl.message("Format E-mail tidak valid",
        name: 'register_error_email_invalid');
  }

  String get register_error_phone_invalid {
    return Intl.message("Format No. Ponsel tidak valid",
        name: 'register_error_phone_invalid');
  }

  String get register_error_password_invalid {
    return Intl.message("Password minimal 6 karakter",
        name: 'register_error_password_invalid');
  }

  String get register_error_password_confirm_invalid {
    return Intl.message("Password konfirmasi tidak sesuai",
        name: 'register_error_password_confirm_invalid');
  }

  String get training_material_app_bar_title {
    return Intl.message("Training Material",
        name: 'training_material_app_bar_title');
  }

  String get training_material_kategori_title {
    return Intl.message("Kategori Training",
        name: 'training_material_kategori_title');
  }

  String get training_material_materi_title {
    return Intl.message("Materi Training Terbaru",
        name: 'training_material_materi_title');
  }

  String get token_expired_title {
    return Intl.message("Waktu Habis", name: 'token_expired_title');
  }

  String get token_expired_content {
    return Intl.message(
        "Waktu anda habis. Mohon Login kembali untuk melanjutkan.",
        name: 'token_expired_content');
  }

  String get forgot_get_password {
    return Intl.message("DAPATKAN PASSWORD BARU", name: 'forgot_get_password');
  }

  String get forgot_email_phone_input {
    return Intl.message("Email atau Nomor Ponsel Anda",
        name: 'forgot_email_phone_input');
  }

  String get forgot_sales_code_msg {
    return Intl.message("Masukkan Kode Sales Anda",
        name: 'forgot_sales_code_msg');
  }

  String get forgot_account_unactive {
    return Intl.message(
        "Anda belum mengaktifkan akun anda. Silahkan menghubungi dealer anda untuk mengetahui password anda.",
        name: 'forgot_account_unactive');
  }

  String get forgot_insert_phone_email_message {
    return Intl.message(
        "Masukkan Email atau Nomor Ponsel yang digunakan saat mengaktifkan akun anda.",
        name: 'forgot_insert_phone_email_message');
  }

  String get forgot_password_title {
    return Intl.message("Lupa Password", name: 'forgot_password_title');
  }

  String get change_password_old_password_title {
    return Intl.message("Password Lama Anda",
        name: 'change_password_old_password_title');
  }

  String get change_password_new_password_title {
    return Intl.message("Password Baru Anda",
        name: 'change_password_new_password_title');
  }

  String get profile_tittle {
    return Intl.message("PROFILE", name: 'profile_tittle');
  }

  String get profile_notice_to_update {
    return Intl.message(
        "Silakan periksa profile anda, dan mohon hubungi admin dealer jika terdapat data yang tidak sesuai",
        name: 'profile_notice_to_update');
  }

  String get profile_last_year_grade {
    return Intl.message("Grade Tahun Lalu (Final)",
        name: 'profile_last_year_grade');
  }

  String get profile_ytd_grade {
    return Intl.message("Grade Saat Ini (Temporary)",
        name: 'profile_ytd_grade');
  }

  String get profile_info_position {
    return Intl.message("Posisi", name: 'profile_info_position');
  }

  String get profile_info_year_join {
    return Intl.message("Tanggal Masuk", name: 'profile_info_year_join');
  }

  String get profile_info_leader {
    return Intl.message("Nama Atasan", name: 'profile_info_leader');
  }

  String get profile_info_dealer_city {
    return Intl.message("Kota Dealer", name: 'profile_info_dealer_city');
  }

  String get profile_info_dealer_name {
    return Intl.message("Nama Dealer", name: 'profile_info_dealer_name');
  }

  String get profile_info_dealer_branch {
    return Intl.message("Cabang Dealer", name: 'profile_info_dealer_branch');
  }

  String get profile_info_footer {
    return Intl.message(
        "Data di atas, adalah data yang tercatat melalui admin dealer. Perubahan data hanya dapat dilakukan melalui pembaruan data di admin dealer.",
        name: 'profile_info_footer');
  }

  String get profile_barcode_button_label {
    return Intl.message("MY BARCODE", name: 'profile_barcode_button_label');
  }

  String get profile_upload_photo_title {
    return Intl.message("Pilih Foto", name: 'profile_upload_photo_title');
  }

  String get profile_upload_photo_open_camera {
    return Intl.message("Buka Kamera",
        name: 'profile_upload_photo_open_camera');
  }

  String get profile_upload_photo_open_gallery {
    return Intl.message("Ambil dari Gallery",
        name: 'profile_upload_photo_open_gallery');
  }

  String get faq_page_title {
    return Intl.message("FAQ", name: 'faq_page_title');
  }

  String get faq_title {
    return Intl.message("Frequently Ask Question", name: 'faq_title');
  }

  String get faq_sub_title_1 {
    return Intl.message("Daftar Pertanyaan & Jawaban", name: 'faq_sub_title_1');
  }

  String get faq_sub_title_2 {
    return Intl.message("Tentang Sales Force ID", name: 'faq_sub_title_2');
  }

  String get bulletin_page_title {
    return Intl.message("Salesman Bulletin", name: 'bulletin_page_title');
  }

  String get notification_title {
    return Intl.message("Notifikasi", name: 'notification_title');
  }

  String get notification_delete_title {
    return Intl.message("Menghapus", name: 'notification_delete_title');
  }

  String notification_delete_body(counter) {
    return Intl.message("Apakah anda yakin menghapus ${counter} notifikasi ?",
        name: 'notification_delete_body', args: [counter]);
  }

  String get quick_guide_title {
    return Intl.message("Quick Guide", name: 'quick_guide_title');
  }

  String get profile_modal_title {
    return Intl.message("Segera Perbarui Data Pribadi Anda.",
        name: 'profile_modal_title');
  }

  String get profile_modal_notice {
    return Intl.message(
        "Anda mengakses akun Sales Force ID dengan email dan nomor Ponsel yang berbeda dengan yang tercatat di admin dealer.\n\nSegera hubungi admin dealer anda untuk melakukan pembaruan.",
        name: 'profile_modal_notice');
  }

  String get alert_dialog_cancel_title {
    return Intl.message("Konfirmasi", name: 'alert_dialog_cancel_title');
  }

  String get alert_dialog_cancel_content {
    return Intl.message("Apakah anda yakin mau keluar?",
        name: 'alert_dialog_cancel_content');
  }

  String get resend_otp_body {
    return Intl.message("OTP dikirim kembali", name: 'resend_otp_body');
  }

  String get label_continue {
    return Intl.message("LANJUT", name: 'label_continue');
  }

  String get label_ok {
    return Intl.message("OK", name: 'label_ok');
  }

  String get label_help {
    return Intl.message("Bantuan?", name: 'label_help');
  }

  String get label_change {
    return Intl.message("Ganti", name: 'label_change');
  }

  String get label_back {
    return Intl.message("Kembali", name: 'label_back');
  }

  String get label_enter {
    return Intl.message("Masuk", name: 'label_enter');
  }

  String get label_save {
    return Intl.message("Simpan", name: 'label_save');
  }

  String get label_cancel {
    return Intl.message("Batalkan", name: 'label_cancel');
  }

  String get label_success {
    return Intl.message("Sukses", name: 'label_success');
  }

  String get label_failed {
    return Intl.message("Gagal", name: 'label_failed');
  }

  String get label_send {
    return Intl.message("Kirimkan", name: 'label_send');
  }

  String get label_agree {
    return Intl.message("Setuju", name: 'label_agree');
  }

  String get label_no {
    return Intl.message("Tidak", name: 'label_no');
  }

  String get label_yes {
    return Intl.message("Ya", name: 'label_yes');
  }

  String get label_old_password {
    return Intl.message("Password Lama", name: 'label_old_password');
  }

  String get label_new_password {
    return Intl.message("Password Baru", name: 'label_new_password');
  }

  String get label_confirm_password {
    return Intl.message("Konfirmasi Password", name: 'label_confirm_password');
  }

  String get label_input_new_phone {
    return Intl.message("Masukkan Nomor Ponsel Baru Anda",
        name: 'label_input_new_phone');
  }

  String get label_input_new_email {
    return Intl.message("Masukkan Email Baru Anda",
        name: 'label_input_new_email');
  }

  String get label_not_agree {
    return Intl.message("Tidak Setuju", name: 'label_not_agree');
  }

  String get label_loading {
    return Intl.message("Loading...", name: 'label_loading');
  }

  String get label_error {
    return Intl.message("Error", name: 'label_error');
  }

  String get label_try_again {
    return Intl.message("Coba Lagi", name: 'label_try_again');
  }

  String get label_validation_email {
    return Intl.message("Bukan e-mail yang valid",
        name: 'label_validation_email');
  }

  String get label_validation_phone {
    return Intl.message("Bukan nomor yang valid",
        name: 'label_validation_phone');
  }

  String get label_validation_salesCode {
    return Intl.message("Kode sales tidak valid",
        name: 'label_validation_salesCode');
  }

  String get label_delete {
    return Intl.message("Hapus", name: 'label_delete');
  }

  String get training_recommendation_title {
    return Intl.message("Materi yang direkomendasikan\nuntuk anda.",
        name: 'training_recommendation_title');
  }

  String get training_recomendation {
    return Intl.message("Materi Training Terbaru",
        name: 'training_recomendation');
  }

  String get training_recomendation_all {
    return Intl.message("Lihat Semua", name: 'training_recomendation_all');
  }

  String get training_title_light_commercial_vehicle {
    return Intl.message("Light Commercial Vehicle",
        name: 'training_title_light_commercial_vehicle');
  }

  String get training_title_passanger_car {
    return Intl.message("Passenger Car", name: 'training_title_passanger_car');
  }

  String get training_placeholder_search {
    return Intl.message("search", name: 'training_placeholder_search');
  }

  String get widget_custom_list_tile_video {
    return Intl.message("video", name: 'widget_custom_list_tile_video');
  }

  String get setting_title {
    return Intl.message("Setting", name: 'setting_title');
  }

  String get setting_change_email {
    return Intl.message("Ganti Email", name: 'setting_change_email');
  }

  String get setting_change_phone {
    return Intl.message("Ganti Nomor Ponsel", name: 'setting_change_phone');
  }

  String get setting_change_email_description {
    return Intl.message("Akun Sales Force ID anda terhubung dengan email",
        name: 'setting_change_email_description');
  }

  String get setting_change_phone_description {
    return Intl.message(
        "Akun Sales Force ID anda terhubung dengan nomor Ponsel",
        name: 'setting_change_phone_description');
  }

  String get setting_change_connected_phone_for_otp {
    return Intl.message(
        "Akun Sales Force ID anda terhubung dengan nomor Ponsel untuk proses verifikasi keamanan akun anda",
        name: 'setting_change_connected_phone_for_otp');
  }

  String get setting_menu_account_setting {
    return Intl.message("Pengaturan Akun",
        name: 'setting_menu_account_setting');
  }

  String get setting_menu_change_password {
    return Intl.message("Ganti Password", name: 'setting_menu_change_password');
  }

  String get setting_menu_phone {
    return Intl.message("Ponsel", name: 'setting_menu_phone');
  }

  String get setting_menu_email {
    return Intl.message("Email", name: 'setting_menu_email');
  }

  String get setting_menu_app {
    return Intl.message("Pengaturan Aplikasi", name: 'setting_menu_app');
  }

  String get setting_menu_notification {
    return Intl.message("Notifikasi", name: 'setting_menu_notification');
  }

  String get setting_menu_app_version {
    return Intl.message("App Version", name: 'setting_menu_app_version');
  }

  String get setting_menu_logout {
    return Intl.message("Logout", name: 'setting_menu_logout');
  }

  String get setting_update_phone_email_success {
    return Intl.message("Email/No Telp baru anda berhasil disimpan.",
        name: 'setting_update_phone_email_success');
  }

  String get pkt_send_new_report {
    return Intl.message("Kirim Laporan\nBaru", name: 'pkt_send_new_report');
  }

  String get pkt_history_report {
    return Intl.message("Riwayat\nLaporan", name: 'pkt_history_report');
  }

  String get pkt_manual_appbartitle {
    return Intl.message("Lapor Pengiriman", name: 'pkt_manual_appbartitle');
  }

  String get pkt_manual_title {
    return Intl.message("Laporan Manual", name: 'pkt_manual_title');
  }

  String get pkt_manual_report_label {
    return Intl.message("LAPOR MANUAL", name: 'pkt_manual_report_label');
  }

  String get pkt_manual_content {
    return Intl.message(
        "Isi nomor Vin kendaraan dan sertakan\nfoto barcode VIN kendaraan untuk\nmelaporkan pengiriman manual",
        name: 'pkt_manual_content');
  }

  String get pkt_manual_label_vin {
    return Intl.message("Nomor VIN", name: 'pkt_manual_label_vin');
  }

  String get pkt_manual_label_continue {
    return Intl.message("LANJUT", name: 'pkt_manual_label_continue');
  }

  String get pkt_manual_vin_not_found_title {
    return Intl.message("Nomor Vin tidak ditemukan\ndi Database",
        name: 'pkt_manual_vin_not_found_title');
  }

  String get pkt_manual_vin_not_found_content {
    return Intl.message(
        "Periksa kembali VIN yang anda\nmasukkan atau lakukan scanning pada\nbarcode yang ada",
        name: 'pkt_manual_vin_not_found_content');
  }

  String get pkt_manual_button_scan {
    return Intl.message("SCAN BARCODE", name: 'pkt_manual_button_scan');
  }

  String get pkt_manual_button_edit {
    return Intl.message("EDIT LAPORAN MANUAL", name: 'pkt_manual_button_edit');
  }

  String get pkt_scan_description {
    return Intl.message(
        "Pindai kode PKT untuk\nmengirimkan laporan\npengiriman",
        name: 'pkt_scan_description');
  }

  String get pkt_scan_result_save_draft_label {
    return Intl.message("Save as Draft",
        name: 'pkt_scan_result_save_draft_label');
  }

  String get pkt_manual_report_description {
    return Intl.message(
        "Posisikan barcode VIN dalam kotak\ndi bawah ini dan pastikan gambar\nbarcode VIN terfoto dengan jelas",
        name: 'pkt_manual_report_description');
  }

  String get pkt_report_failed {
    return Intl.message(
        "Laporan anda gagal disimpan.\nUlang kembali beberapa saat lagi.",
        name: 'pkt_report_failed');
  }

  String get pkt_report_success {
    return Intl.message("Laporan anda berhasil\ndisimpan.",
        name: 'pkt_report_success');
  }

  String get pkt_car_type_label {
    return Intl.message("Car Type", name: 'pkt_car_type_label');
  }

  String get pkt_car_identity_label {
    return Intl.message("Identitas Kendaraan", name: 'pkt_car_identity_label');
  }

  String get pkt_sales_identity_label {
    return Intl.message("Identitas Sales", name: 'pkt_sales_identity_label');
  }

  String get pkt_date_label {
    return Intl.message("Date & Time", name: 'pkt_date_label');
  }

  String get pkt_vin_label {
    return Intl.message("VIN", name: 'pkt_vin_label');
  }

  String get pkt_vehicle_type_label {
    return Intl.message("Tipe Kendaraan", name: 'pkt_vehicle_type_label');
  }

  String get pkt_vehicle_color_label {
    return Intl.message("Warna", name: 'pkt_vehicle_color_label');
  }

  String get pkt_sales_name_label {
    return Intl.message("Nama", name: 'pkt_sales_name_label');
  }

  String get pkt_report_type_label {
    return Intl.message("Report Type", name: 'pkt_report_type_label');
  }

  String get pkt_note_label {
    return Intl.message("Additional Info", name: 'pkt_note_label');
  }

  String get pkt_draft_title {
    return Intl.message("Draft Laporan", name: 'pkt_draft_title');
  }

  String get pkt_draft_send_report {
    return Intl.message("Kirim Laporan", name: 'pkt_draft_send_report');
  }

  String get pkt_success_send_report {
    return Intl.message("Sukses Tersimpan", name: 'pkt_success_send_report');
  }

  String get pkt_manual_failed_dialog_title {
    return Intl.message("VIN Sudah Pernah\nLapor Kirim",
        name: 'pkt_manual_failed_dialog_title');
  }

  String get pkt_manual_failed_dialog_label {
    return Intl.message("Report Info", name: 'pkt_manual_failed_dialog_label');
  }

  String get term_condition_title {
    return Intl.message("Syarat dan Ketentuan", name: 'term_condition_title');
  }

  String get term_condition_content_title {
    return Intl.message("Syarat & ketentuan",
        name: 'term_condition_content_title');
  }

  String get setting_info_title {
    return Intl.message("Informasi Aplikasi", name: 'setting_info_title');
  }

  String get disclaimer_tittle {
    return Intl.message("Disclaimer", name: 'disclaimer_tittle');
  }

  String get disclaimer_sub_tittle {
    return Intl.message(
        "Copyright \u00a9 PT. Mitsubishi Motors\nKrama Yudha Sales Indonesia",
        name: 'disclaimer_sub_tittle');
  }

  String get disclaimer_content_top {
    return Intl.message(
        "Materi ini dan isinya dilindungi oleh ketentuan perundang-undangan yang berlaku dari penggunaan yang tidak semestinya dan digunakan oleh PT. Mitsubishi Motors Krama Yudha Sales Indonesia ('PT. MMKSI') sebagai distributor resmi produk kendaraan Mitsubishi di Indonesia.",
        name: 'disclaimer_content_top');
  }

  String get disclaimer_content_bottom {
    return Intl.message(
        "Dilarang keras mempublikasikan, mengedit materi ini baik sebagian maupun keseluruhannya, tanpa seizin PT. MMKSI sebelumnya.",
        name: 'disclaimer_content_bottom');
  }

  String get unauthorized_label {
    return Intl.message(
        "Anda tidak memiliki wewenang untuk mengirimkan PKT ini.\n\nVIN : ",
        name: 'unauthorized_label');
  }

  String get password_minimal_error {
    return Intl.message("Password minimal 6 karakter",
        name: 'password_minimal_error');
  }

  String get password_konfirmasi_error {
    return Intl.message("Konfirmasi password tidak sesuai",
        name: 'password_konfirmasi_error');
  }

  String get change_password {
    return Intl.message("Ganti Password", name: 'change_password');
  }

  String get setting_update_email_success {
    return Intl.message("Email baru anda berhasil disimpan.",
        name: 'setting_update_email_success');
  }

  String get setting_update_phone_success {
    return Intl.message("No Ponsel baru anda berhasil disimpan.",
        name: 'setting_update_phone_success');
  }

  String get notification_failed_dialog {
    return Intl.message("Notifikasi tidak boleh dihapus",
        name: 'notification_failed_dialog');
  }

  String get error_login_fail_salesman_not_registered_content {
    return Intl.message("Kode sales tidak valid.",
        name: 'error_login_fail_salesman_not_registered_content');
  }

  String get error_login_fail_salesman_not_registered_btn {
    return Intl.message("Kode sales tidak valid.",
        name: 'error_login_fail_salesman_not_registered_btn');
  }

  String get error_verify_vin_fail_not_found {
    return Intl.message("VIN tidak ditemukan",
        name: 'error_verify_vin_fail_not_found');
  }

  String get profile_level {
    return Intl.message("Level", name: 'profile_level');
  }

  String get profile_kode_dealer {
    return Intl.message("Kode Dealer", name: 'profile_kode_dealer');
  }

  String get profile_grup {
    return Intl.message("Group Dealer", name: 'profile_grup');
  }

  String get empty_material_title {
    return Intl.message("No Items Found Here", name: 'empty_material_title');
  }

  String get empty_material_description {
    return Intl.message(
        "Kami akan segera menghubungimu\njika ada konten terbaru",
        name: 'empty_material_description');
  }

  String get empty_search_title {
    return Intl.message("Pencarian Tidak Ditemukan",
        name: 'empty_search_title');
  }

  String get cek_PDI {
    return Intl.message("Check PDI", name: 'cek_PDI');
  }

  String get cek_PDI_description {
    return Intl.message("Memindai PDI date", name: 'cek_PDI_description');
  }

  String get category_team {
    return Intl.message("Kategori Tim", name: 'category_team');
  }

  String get profile_email {
    return Intl.message("Email", name: 'profile_email');
  }

  String get profile_phone {
    return Intl.message("No. Ponsel", name: 'profile_phone');
  }

  String get pdi_expired_failed_content {
    return Intl.message(
        "PDI Date sudah lebih dari 1 bulan, mohon untuk melakukan konfirmasi pada tim terkait",
        name: 'pdi_expired_failed_content');
  }

  String get pdi_empty_failed_content {
    return Intl.message(
        "PDI date tidak terisi, mohon untuk melakukan konfirmasi pada tim terkait",
        name: 'pdi_empty_failed_content');
  }

  String get pdi_success_content {
    return Intl.message("PDI Date terkonfirmasi", name: 'pdi_success_content');
  }

  String get pdi_manual_appbar_title {
    return Intl.message("Check PDI", name: 'pdi_manual_appbar_title');
  }

  String get pdi_manual_content_title {
    return Intl.message("Check PDI Manual", name: 'pdi_manual_content_title');
  }

  String get pdi_manual_content {
    return Intl.message(
        "Isi nomor VIN Kendaraan untuk\nmelakukan cek PDI Manual",
        name: 'pdi_manual_content');
  }

  String get no_connection {
    return Intl.message("Please cek your connection for login. Thank you",
        name: 'no_connection');
  }

  String get error_rooted_title {
    return Intl.message("Invalid PackageName", name: 'error_rooted_title');
  }

  String get error_rooted_content {
    return Intl.message(
        "Package name aplikasi anda tidak sesuai. Silakan ganti package name yang sesuai.",
        name: 'error_rooted_content');
  }

  String get old_user {
    return Intl.message("Apakah ini benar akun anda?", name: 'old_user');
  }

  String get confirm_user {
    return Intl.message("Konfirmasi Akun", name: 'confirm_user');
  }

  String get next {
    return Intl.message("Lanjutkan", name: 'next');
  }

  String get label_close {
    return Intl.message("TUTUP", name: 'label_close');
  }

  String get alfabet {
    return Intl.message("Alfabet", name: 'alfabet');
  }

  String get customer {
    return Intl.message("Customer", name: 'customer');
  }

  String get contact {
    return Intl.message("Contact", name: 'contact');
  }

  String get address_label {
    return Intl.message("Alamat", name: 'address_label');
  }

  String get email_label {
    return Intl.message("Email", name: 'email_label');
  }

  String get province_label {
    return Intl.message("Provinsi", name: 'province_label');
  }

  String get city_label {
    return Intl.message("Kota", name: 'city_label');
  }

  String get contact_source_label {
    return Intl.message("Sumber Kontak", name: 'contact_source_label');
  }

  String get note_label {
    return Intl.message("Catatan", name: 'note_label');
  }

  String get contact_sort_label {
    return Intl.message("Urutkan", name: 'contact_sort_label');
  }

  String get contact_failed_dialog {
    return Intl.message("Kontak gagal dihapus. Coba ulangi kembali",
        name: 'contact_failed_dialog');
  }

  String get private_information {
    return Intl.message("Informasi Pribadi", name: 'private_information');
  }

  String get other_information {
    return Intl.message("Informasi Lainnya", name: 'other_information');
  }

  String get customer_not_found {
    return Intl.message("Customer tidak ditemukan", name: 'customer_not_found');
  }

  String get contact_not_found {
    return Intl.message("Contact tidak ditemukan", name: 'contact_not_found');
  }

  String get empty_contact {
    return Intl.message("Contact Kosong", name: 'empty_contact');
  }

  String get empty_customer {
    return Intl.message("Contact Customer Kosong", name: 'empty_customer');
  }

  String get select_from {
    return Intl.message("Dipilih Dari", name: 'select_from');
  }

  String get delete {
    return Intl.message("HAPUS", name: 'delete');
  }

  String get delete_all_contact {
    return Intl.message("HAPUS SEMUA", name: 'delete_all_contact');
  }

  String get add_contact {
    return Intl.message("Tambah Kontak", name: 'add_contact');
  }

  String get add_customer {
    return Intl.message("Tambah Customer", name: 'add_customer');
  }

  String get edit_contact {
    return Intl.message("Edit Contact", name: 'edit_contact');
  }

  String get detail_contact {
    return Intl.message("Detail Kontak", name: 'detail_contact');
  }

  String get edit_label {
    return Intl.message("Edit", name: 'edit_label');
  }

  String get edit_list_contact {
    return Intl.message("Edit Daftar Kontak", name: 'edit_list_contact');
  }

  String get delete_contact {
    return Intl.message("Hapus Kontak", name: 'delete_contact');
  }

  String get import_contact {
    return Intl.message("Impor Kontak dari Ponsel", name: 'import_contact');
  }

  String get create_edit_date {
    return Intl.message("Tanggal Dibuat/Diedit", name: 'create_edit_date');
  }

  String get sort_type {
    return Intl.message("Jenis Urutan", name: 'sort_type');
  }

  String get history_contact {
    return Intl.message("CONTACT HISTORY", name: 'history_contact');
  }

  String get call_contact {
    return Intl.message("Panggil Kontak", name: 'call_contact');
  }

  String get call_contact_via_phone {
    return Intl.message("Panggil Melalui Panggilan Seluler",
        name: 'call_contact_via_phone');
  }

  String get call_contact_via_whatsapp {
    return Intl.message("Panggil Melalui Whatsapp",
        name: 'call_contact_via_whatsapp');
  }

  String get send_message {
    return Intl.message("Kirim Pesan", name: 'send_message');
  }

  String get send_message_via_sms {
    return Intl.message("Kirim Pesan Melalui SMS",
        name: 'send_message_via_sms');
  }

  String get send_message_via_whatsapp {
    return Intl.message("Kirim Pesan Melalui Whatsapp",
        name: 'send_message_via_whatsapp');
  }

  String get send_message_via_email {
    return Intl.message("Kirim Pesan Melalui E-Mail",
        name: 'send_message_via_email');
  }

  String get email_not_valid {
    return Intl.message("Email tidak valid", name: 'email_not_valid');
  }

  String get contact_first_name {
    return Intl.message("Nama Depan", name: 'contact_first_name');
  }

  String get contact_last_name {
    return Intl.message("Nama Belakang", name: 'contact_last_name');
  }

  String get contact_up_label {
    return Intl.message("Naik", name: 'contact_up_label');
  }

  String get contact_down_label {
    return Intl.message("Turun", name: 'contact_down_label');
  }

  String get contact_name_label {
    return Intl.message("Nama", name: 'contact_name_label');
  }

  String get contact_sales_name {
    return Intl.message("Nama Sales", name: 'contact_sales_name');
  }

  String get contact_type_customer_label {
    return Intl.message("Jenis Pelanggan", name: 'contact_type_customer_label');
  }

  String get contact_type_gender_label {
    return Intl.message("Jenis Kelamin", name: 'contact_type_gender_label');
  }

  String get contact_from_ponsel {
    return Intl.message("Kontak dari Ponsel", name: 'contact_from_ponsel');
  }

  String get contact_set_order_list {
    return Intl.message("Atur Urutan Daftar", name: 'contact_set_order_list');
  }

  String get contact_make_suspect {
    return Intl.message("Jadikan Suspect", name: 'contact_make_suspect');
  }

  String get contact_order_contact {
    return Intl.message("Urutkan Kontak", name: 'contact_order_contact');
  }

  String get contact_order_based_on {
    return Intl.message("Urutkan Berdasarkan", name: 'contact_order_based_on');
  }

  String get contact_new_contact {
    return Intl.message("Kontak Baru", name: 'contact_new_contact');
  }

  String get contact_add_other_info {
    return Intl.message("TAMBAHKAN INFO LAINNYA",
        name: 'contact_add_other_info');
  }

  String get save_bottom_sheet_agree {
    return Intl.message("Simpan Kontak", name: 'save_bottom_sheet_agree');
  }

  String get save_bottom_sheet_declined {
    return Intl.message("Jangan Simpan Kontak",
        name: 'save_bottom_sheet_declined');
  }

  String get cancel_bottom_sheet_title {
    return Intl.message("Anda akan keluar sebelum kontak terisi lengkap",
        name: 'cancel_bottom_sheet_title');
  }

  String get cancel_bottom_sheet_agree {
    return Intl.message("Keluar Tanpa Simpan Kontak",
        name: 'cancel_bottom_sheet_agree');
  }

  String get delete_bottom_sheet_title {
    return Intl.message("Kontak ini akan dihapus dari akun anda",
        name: 'delete_bottom_sheet_title');
  }

  String get delete_bottom_sheet_agree_one_contact {
    return Intl.message("HAPUS KONTAK INI",
        name: 'delete_bottom_sheet_agree_one_contact');
  }

  String get delete_bottom_sheet_agree_all_contact {
    return Intl.message("Hapus Semua Kontak",
        name: 'delete_bottom_sheet_agree_all_contact');
  }

  String get new_material_for_you {
    return Intl.message("Terbaru Untuk Anda", name: 'new_material_for_you');
  }

  String get lead_management {
    return Intl.message("Lead Management", name: 'lead_management');
  }

  String get add_suspect {
    return Intl.message("TAMBAH SUSPECT", name: 'add_suspect');
  }

  String get add_from_contact {
    return Intl.message("TAMBAH DARI CONTACT", name: 'add_from_contact');
  }

  String get new_suspect {
    return Intl.message("Suspect Baru", name: 'new_suspect');
  }

  String get all_suspect {
    return Intl.message("All Suspect", name: 'all_suspect');
  }

  String get prospect {
    return Intl.message("All Prospect", name: 'prospect');
  }

  String get won_prospect {
    return Intl.message("Prospect Open", name: 'won_prospect');
  }

  String get bottom_sheet_select_activity_label {
    return Intl.message("Pilih Jenis Aktivitas",
        name: 'bottom_sheet_select_activity_label');
  }

  String get appointment_label {
    return Intl.message("Janji Temu", name: 'appointment_label');
  }

  String get phone_call_label {
    return Intl.message("Panggilan Telepon", name: 'phone_call_label');
  }

  String get task_label {
    return Intl.message("Tugas", name: 'task_label');
  }

  String get cust_name_label {
    return Intl.message("Cust Name", name: 'cust_name_label');
  }

  String get suspect_label {
    return Intl.message("Suspect", name: 'suspect_label');
  }

  String get all {
    return Intl.message("Semua", name: 'all');
  }

  String get new_lead {
    return Intl.message("Baru", name: 'new_lead');
  }

  String get qualified {
    return Intl.message("Terkualifikasi", name: 'qualified');
  }

  String get cancel {
    return Intl.message("Batal", name: 'cancel');
  }

  String get process {
    return Intl.message("Diproses", name: 'process');
  }

  String get customer_name_label {
    return Intl.message("Nama Customer", name: 'customer_name_label');
  }

  String get status_now_label {
    return Intl.message("Status Terkini", name: 'status_now_label');
  }

  String get reason_label {
    return Intl.message("Alasan", name: 'reason_label');
  }

  String get category_label {
    return Intl.message("Kategori", name: 'category_label');
  }

  String get add_suspect_from_contact {
    return Intl.message("Tambah Suspect", name: 'add_suspect_from_contact');
  }

  String get add_suspect_subtitle_primary {
    return Intl.message("Apakah anda yakin ingin menambahkan Kontak ",
        name: 'add_suspect_subtitle_primary');
  }

  String get add_suspect_subtitle_secondary {
    return Intl.message(" ke Suspect Baru ?",
        name: 'add_suspect_subtitle_secondary');
  }
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("id", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({required Locale fallback}) {
    return (List<Locale>? locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({required Locale fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale? locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps

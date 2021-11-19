
part of 'voucher_cubit_cubit.dart';

abstract class VouchercubitState {
  const VouchercubitState();
}

class VouchercubitInitial extends VouchercubitState {}

class VoucherReady extends VouchercubitState {
  final GeneralVoucherDataModel voucher;
  VoucherReady({required this.voucher});
}


class VoucherRefreshing extends VouchercubitState {}

class VoucherSaving extends VouchercubitState {}

class VoucherFetching extends VouchercubitState {}

class VoucherSaved extends VouchercubitState {}

class VoucherSaveError extends VouchercubitState {
  final String error;

  VoucherSaveError({required this.error});
}

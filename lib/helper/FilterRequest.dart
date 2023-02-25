class FilterRequest {
  final String? id;
  late bool? isActive;
  late String? tenantId;

  FilterRequest({
    this.id,
    this.isActive,
    this.tenantId
  });

  set setIsActive(bool value) {
    isActive = value;
  }

  set setTenantId(String? value) {
    tenantId = value;
  }
}

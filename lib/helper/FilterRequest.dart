class FilterRequest {
  final String? id;
  late bool? isActive;
  late String? tenantId;
  late String? organizationId;

  FilterRequest({
    this.id,
    this.isActive,
    this.tenantId,
    this.organizationId
  });

  set setIsActive(bool value) {
    isActive = value;
  }

  set setTenantId(String? value) {
    tenantId = value;
  }

  set setOrganizationId(String? value) {
    organizationId = value;
  }
}

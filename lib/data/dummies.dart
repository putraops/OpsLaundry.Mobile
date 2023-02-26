import 'package:mobile_apps/models/organization.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/models/service_type.dart';
import 'package:mobile_apps/models/tenant.dart';

List<organization> organizationDummies = [
  organization(id: "a3771fc3-30ba-4522-9440-4d2d58753c49", isActive: true, createdAt: DateTime.now(),  name: "Jireh Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  organization(id: "b6ca7504-57ab-42f1-b7a1-5d968274d5ba", isActive: true, createdAt: DateTime.now(), name: "Prapta Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  organization(id: "b6ca7504-57ab-42f1-b7a1-5d968274d5ba", isActive: true, createdAt: DateTime.now(), name: "Putra Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  organization(id: "9f6a1975-47df-4661-b862-53394b0bbc33", isActive: true, createdAt: DateTime.now(), name: "Naomi Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  organization(id: "58fbeb72-1641-49d2-9f4f-37002559f3bf", isActive: true, createdAt: DateTime.now(), name: "Vena Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  organization(id: "00b3db66-315e-4961-86e8-db5fa9a62157", isActive: true, createdAt: DateTime.now(), name: "Ops Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];

List<tenant> tenantDummies = [
  tenant(id: "a", isActive: true, createdAt: DateTime.now(),  organizationName: "Jireh Laundry", name: "Amplas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  tenant(id: "b", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Amplas 32", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  tenant(id: "c", isActive: false, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Coin Laundry", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  tenant(id: "d", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Patumbak", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  tenant(id: "e", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Pintu Air", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];

List<service_type> serviceTypeDummies = [
  service_type(id: "1b6af1c1-28cf-4ae7-a5b0-e8e8d7ea8f46", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49",  organizationName: "Jireh Laundry", name: "Satuan", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  service_type(id: "0cabaeb9-a091-4468-9e40-b0cb4e0f15a7", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49",  organizationName: "Jireh Laundry", name: "Kiloan", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];

List<product_category> productCategoriDummies = [
  product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Baju", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "b", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Celana", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c", isActive: false, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Jas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "d", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Selimut", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Baju", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "b", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Celana", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c", isActive: false, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Jas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "d", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Selimut", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Baju", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "b", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Celana", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c", isActive: false, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Jas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "d", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Selimut", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Baju", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "b", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Celana", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c", isActive: false, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Jas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "d", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Selimut", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];
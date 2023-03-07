import 'package:mobile_apps/models/organization.dart';
import 'package:mobile_apps/models/product.dart';
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
  product_category(id: "a1937669-b307-4bac-af90-fa5a54928e77", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Baju", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c02b4f58-a2fd-4470-8519-d372c8ea58c0", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Celana", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "6883b9bb-2241-47b3-a1a4-35bc132b9b0c", isActive: false, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Jas", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "fe24f3f8-5f74-4337-97aa-fca1d9cedc03", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Selimut", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "c0192cf1-9e1d-450c-8169-cd87c34ce9b6", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Sepatu", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "d7d63078-ab3e-43ec-be93-aad11ff575b2", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Gorden", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "8dc24beb-6773-4367-8df8-d898e7971618", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Boneka", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product_category(id: "ace289ac-0347-4d74-ba83-47e8f0677859", isActive: true, createdAt: DateTime.now(), organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry", name: "Helm", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];

List<product> productDummies = [
  product(
      id: "6aac46dc-6210-454f-8d28-a61b14a6a5d1", isActive: true, createdAt: DateTime.now(),
      organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry",
      name: "Sepatu Kulit",
      product_category_id: "c0192cf1-9e1d-450c-8169-cd87c34ce9b6",
      product_category_name: "Sepatu",
      product_category_description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product(
      id: "8db852a8-9c0c-46ed-99fc-6666e307504d", isActive: true, createdAt: DateTime.now(),
      organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry",
      name: "Sepatu Running",
      product_category_id: "c0192cf1-9e1d-450c-8169-cd87c34ce9b6",
      product_category_name: "Sepatu",
      product_category_description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
  product(
      id: "368dc634-ec84-4fa8-ae37-9d83b60b2a86", isActive: true, createdAt: DateTime.now(),
      organizationId: "a3771fc3-30ba-4522-9440-4d2d58753c49", organizationName: "Jireh Laundry",
      name: "Sepatu Anak-anak",
      product_category_id: "c0192cf1-9e1d-450c-8169-cd87c34ce9b6",
      product_category_name: "Sepatu",
      product_category_description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
];
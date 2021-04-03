//
//  MockItemsService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

class MockItemsService {

    let jsonSearchResult = """
                {
                    "site_id": "MCO",
                    "query": "iPhone 6",
                    "paging": {
                        "total": 738,
                        "primary_results": 1000,
                        "offset": 0,
                        "limit": 50
                    },
                    "results": [
                        {
                            "id": "MCO613074938",
                            "site_id": "MCO",
                            "title": " iPhone 6s 128 Gb Plata",
                            "seller": {
                                "id": 603079728,
                                "permalink": null,
                                "registration_date": null,
                                "car_dealer": false,
                                "real_estate_agency": false,
                                "tags": null
                            },
                            "price": 1020000,
                            "prices": {
                                "id": "MCO613074938",
                                "prices": [
                                    {
                                        "id": "1",
                                        "type": "standard",
                                        "conditions": {
                                            "context_restrictions": [],
                                            "start_time": null,
                                            "end_time": null,
                                            "eligible": true
                                        },
                                        "amount": 1020000,
                                        "regular_amount": null,
                                        "currency_id": "COP",
                                        "exchange_rate_context": "DEFAULT",
                                        "metadata": {},
                                        "last_updated": "2021-03-23T00:45:46Z"
                                    }
                                ],
                                "presentation": {
                                    "display_currency": "COP"
                                },
                                "payment_method_prices": [],
                                "reference_prices": [],
                                "purchase_discounts": []
                            },
                            "sale_price": null,
                            "currency_id": "COP",
                            "available_quantity": 3,
                            "sold_quantity": 0,
                            "buying_mode": "buy_it_now",
                            "listing_type_id": "gold_special",
                            "stop_time": "2041-03-17T04:00:00.000Z",
                            "condition": "new",
                            "permalink": "https://www.mercadolibre.com.co/iphone-6s-128-gb-plata/p/MCO6127578",
                            "thumbnail": "http://http2.mlstatic.com/D_643296-MLA44156279273_112020-I.jpg",
                            "thumbnail_id": "643296-MLA44156279273_112020",
                            "accepts_mercadopago": true,
                            "installments": {
                                "quantity": 36,
                                "amount": 28333.33,
                                "rate": 0,
                                "currency_id": "COP"
                            },
                            "address": {
                                "state_id": "CO-DC",
                                "state_name": "Bogotá D.C.",
                                "city_id": "TUNPQ1JBRjkyNTA2",
                                "city_name": "Rafael Uribe Uribe"
                            },
                            "shipping": {
                                "free_shipping": true,
                                "mode": "me2",
                                "tags": [
                                    "self_service_in",
                                    "mandatory_free_shipping"
                                ],
                                "logistic_type": "xd_drop_off",
                                "store_pick_up": false
                            },
                            "seller_address": {
                                "id": "",
                                "comment": "",
                                "address_line": "",
                                "zip_code": "",
                                "country": {
                                    "id": "CO",
                                    "name": "Colombia"
                                },
                                "state": {
                                    "id": "CO-DC",
                                    "name": "Bogotá D.C."
                                },
                                "city": {
                                    "id": "TUNPQ1JBRjkyNTA2",
                                    "name": "Rafael Uribe Uribe"
                                },
                                "latitude": "",
                                "longitude": ""
                            },
                            "attributes": [
                                {
                                    "name": "Marca",
                                    "values": [
                                        {
                                            "id": "9344",
                                            "name": "Apple",
                                            "struct": null,
                                            "source": 1
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS",
                                    "source": 1,
                                    "id": "BRAND",
                                    "value_id": "9344",
                                    "value_name": "Apple",
                                    "value_struct": null,
                                    "attribute_group_name": "Otros"
                                },
                                {
                                    "id": "GPU_MODEL",
                                    "name": "Modelo de GPU",
                                    "value_id": "8094621",
                                    "value_name": "PowerVR GT7600",
                                    "value_struct": null,
                                    "values": [
                                        {
                                            "id": "8094621",
                                            "name": "PowerVR GT7600",
                                            "struct": null,
                                            "source": 1
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS",
                                    "attribute_group_name": "Otros",
                                    "source": 1
                                },
                                {
                                    "value_id": "2230284",
                                    "value_name": "Nuevo",
                                    "values": [
                                        {
                                            "id": "2230284",
                                            "name": "Nuevo",
                                            "struct": null,
                                            "source": 7092
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS",
                                    "attribute_group_name": "Otros",
                                    "id": "ITEM_CONDITION",
                                    "name": "Condición del ítem",
                                    "value_struct": null,
                                    "source": 7092
                                },
                                {
                                    "id": "LINE",
                                    "value_name": "iPhone",
                                    "value_struct": null,
                                    "name": "Línea",
                                    "value_id": "58993",
                                    "values": [
                                        {
                                            "struct": null,
                                            "source": 1,
                                            "id": "58993",
                                            "name": "iPhone"
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS",
                                    "attribute_group_name": "Otros",
                                    "source": 1
                                },
                                {
                                    "attribute_group_name": "Otros",
                                    "source": 1,
                                    "id": "MODEL",
                                    "name": "Modelo",
                                    "value_id": "312151",
                                    "value_name": "iPhone 6s",
                                    "value_struct": null,
                                    "values": [
                                        {
                                            "struct": null,
                                            "source": 1,
                                            "id": "312151",
                                            "name": "iPhone 6s"
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS"
                                },
                                {
                                    "source": 1,
                                    "id": "PROCESSOR_MODEL",
                                    "name": "Modelo del procesador",
                                    "value_id": "6973026",
                                    "value_struct": null,
                                    "attribute_group_name": "Otros",
                                    "value_name": "Apple A9",
                                    "values": [
                                        {
                                            "id": "6973026",
                                            "name": "Apple A9",
                                            "struct": null,
                                            "source": 1
                                        }
                                    ],
                                    "attribute_group_id": "OTHERS"
                                },
                                {
                                    "value_struct": {
                                        "number": 143,
                                        "unit": "g"
                                    },
                                    "attribute_group_id": "OTHERS",
                                    "attribute_group_name": "Otros",
                                    "source": 1,
                                    "id": "WEIGHT",
                                    "name": "Peso",
                                    "value_name": "143 g",
                                    "value_id": "522899",
                                    "values": [
                                        {
                                            "source": 1,
                                            "id": "522899",
                                            "name": "143 g",
                                            "struct": {
                                                "number": 143,
                                                "unit": "g"
                                            }
                                        }
                                    ]
                                }
                            ],
                            "original_price": null,
                            "category_id": "MCO1055",
                            "official_store_id": null,
                            "domain_id": "MCO-CELLPHONES",
                            "catalog_product_id": "MCO6127578",
                            "tags": [
                                "good_quality_picture",
                                "immediate_payment",
                                "cart_eligible"
                            ],
                            "catalog_listing": true,
                            "use_thumbnail_id": true,
                            "order_backend": 1
                        }
                ]
            }
    """

    let jsonItem = """
        {
            "id": "MCO613074938",
            "site_id": "MCO",
            "title": " iPhone 6s 128 Gb Plata",
            "seller": {
                "id": 603079728,
                "permalink": null,
                "registration_date": null,
                "car_dealer": false,
                "real_estate_agency": false,
                "tags": null
            },
            "price": 1020000,
            "prices": {
                "id": "MCO613074938",
                "prices": [
                    {
                        "id": "1",
                        "type": "standard",
                        "conditions": {
                            "context_restrictions": [],
                            "start_time": null,
                            "end_time": null,
                            "eligible": true
                        },
                        "amount": 1020000,
                        "regular_amount": null,
                        "currency_id": "COP",
                        "exchange_rate_context": "DEFAULT",
                        "metadata": {},
                        "last_updated": "2021-03-23T00:45:46Z"
                    }
                ],
                "presentation": {
                    "display_currency": "COP"
                },
                "payment_method_prices": [],
                "reference_prices": [],
                "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "COP",
            "available_quantity": 3,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_special",
            "stop_time": "2041-03-17T04:00:00.000Z",
            "condition": "new",
            "permalink": "https://www.mercadolibre.com.co/iphone-6s-128-gb-plata/p/MCO6127578",
            "thumbnail": "http://http2.mlstatic.com/D_643296-MLA44156279273_112020-I.jpg",
            "thumbnail_id": "643296-MLA44156279273_112020",
            "accepts_mercadopago": true,
            "installments": {
                "quantity": 36,
                "amount": 28333.33,
                "rate": 0,
                "currency_id": "COP"
            },
            "address": {
                "state_id": "CO-DC",
                "state_name": "Bogotá D.C.",
                "city_id": "TUNPQ1JBRjkyNTA2",
                "city_name": "Rafael Uribe Uribe"
            },
            "shipping": {
                "free_shipping": true,
                "mode": "me2",
                "tags": [
                    "self_service_in",
                    "mandatory_free_shipping"
                ],
                "logistic_type": "xd_drop_off",
                "store_pick_up": false
            },
            "seller_address": {
                "id": "",
                "comment": "",
                "address_line": "",
                "zip_code": "",
                "country": {
                    "id": "CO",
                    "name": "Colombia"
                },
                "state": {
                    "id": "CO-DC",
                    "name": "Bogotá D.C."
                },
                "city": {
                    "id": "TUNPQ1JBRjkyNTA2",
                    "name": "Rafael Uribe Uribe"
                },
                "latitude": "",
                "longitude": ""
            },
            "attributes": [
                {
                    "name": "Marca",
                    "values": [
                        {
                            "id": "9344",
                            "name": "Apple",
                            "struct": null,
                            "source": 1
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "source": 1,
                    "id": "BRAND",
                    "value_id": "9344",
                    "value_name": "Apple",
                    "value_struct": null,
                    "attribute_group_name": "Otros"
                },
                {
                    "id": "GPU_MODEL",
                    "name": "Modelo de GPU",
                    "value_id": "8094621",
                    "value_name": "PowerVR GT7600",
                    "value_struct": null,
                    "values": [
                        {
                            "id": "8094621",
                            "name": "PowerVR GT7600",
                            "struct": null,
                            "source": 1
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "source": 1
                },
                {
                    "value_id": "2230284",
                    "value_name": "Nuevo",
                    "values": [
                        {
                            "id": "2230284",
                            "name": "Nuevo",
                            "struct": null,
                            "source": 7092
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "id": "ITEM_CONDITION",
                    "name": "Condición del ítem",
                    "value_struct": null,
                    "source": 7092
                },
                {
                    "id": "LINE",
                    "value_name": "iPhone",
                    "value_struct": null,
                    "name": "Línea",
                    "value_id": "58993",
                    "values": [
                        {
                            "struct": null,
                            "source": 1,
                            "id": "58993",
                            "name": "iPhone"
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "source": 1
                },
                {
                    "attribute_group_name": "Otros",
                    "source": 1,
                    "id": "MODEL",
                    "name": "Modelo",
                    "value_id": "312151",
                    "value_name": "iPhone 6s",
                    "value_struct": null,
                    "values": [
                        {
                            "struct": null,
                            "source": 1,
                            "id": "312151",
                            "name": "iPhone 6s"
                        }
                    ],
                    "attribute_group_id": "OTHERS"
                },
                {
                    "source": 1,
                    "id": "PROCESSOR_MODEL",
                    "name": "Modelo del procesador",
                    "value_id": "6973026",
                    "value_struct": null,
                    "attribute_group_name": "Otros",
                    "value_name": "Apple A9",
                    "values": [
                        {
                            "id": "6973026",
                            "name": "Apple A9",
                            "struct": null,
                            "source": 1
                        }
                    ],
                    "attribute_group_id": "OTHERS"
                },
                {
                    "value_struct": {
                        "number": 143,
                        "unit": "g"
                    },
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "source": 1,
                    "id": "WEIGHT",
                    "name": "Peso",
                    "value_name": "143 g",
                    "value_id": "522899",
                    "values": [
                        {
                            "source": 1,
                            "id": "522899",
                            "name": "143 g",
                            "struct": {
                                "number": 143,
                                "unit": "g"
                            }
                        }
                    ]
                }
            ],
            "original_price": null,
            "category_id": "MCO1055",
            "official_store_id": null,
            "domain_id": "MCO-CELLPHONES",
            "catalog_product_id": "MCO6127578",
            "tags": [
                "good_quality_picture",
                "immediate_payment",
                "cart_eligible"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "order_backend": 1
        }
    """

}

extension MockItemsService: ItemsService {
    
    func items(byTerm term: String, completion: ([Item], Error?) -> Void) {
        guard let jsonData = jsonSearchResult.data(using: .utf8) else { return completion([], ItemServiceErrors.unableToLoadMock) }
        do {
            let itemDTO = try JSONDecoder().decode(SearchResultDTO.self, from: jsonData)
            completion(itemDTO.results, nil)
        } catch {
            completion([], error)
        }
    }
    
    func nextPageItems(completion: @escaping ([Item], Error?) -> Void) {
        items(byTerm: "", completion: completion)
    }
}

extension MockItemsService {
    func item() -> Item? {
        guard let jsonData = jsonItem.data(using: .utf8) else { return nil }
        do {
            let itemDTO = try JSONDecoder().decode(ItemDTO.self, from: jsonData)
            return itemDTO
        } catch {
            debugPrint(error)
        }
        return nil
    }
}

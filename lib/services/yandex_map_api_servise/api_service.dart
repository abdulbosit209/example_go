import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gotaxi/data/models/geo_model/geocoding.dart';
import 'api_client.dart';


class MapApiService {
  MapApiService({required this.mapApiClient});
  MapApiClient mapApiClient;

  Future<String> getLocationName(String geoCodeText) async {
    try {
      late Response response;
      Map<String, String> qParams = {
        'apikey': '98766a71-a866-47bf-8184-2f9cb48187d2',
        'geocode': geoCodeText,
        'lang': 'uz_UZ',
        'format': 'json',
        'kind': 'house',
        'rspn': '1',
        'results': '1',
      };
      debugPrint("QueryParams>>>>>>>>>>$qParams");
      response = await mapApiClient.dio.get(
        mapApiClient.dio.options.baseUrl,
        queryParameters: qParams,
      );
      String text = '';
      if (response.statusCode! == HttpStatus.ok) {
        Geocoding geocoding = Geocoding.fromJson(response.data);

        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0].geoObject
              .metaDataProperty.geocoderMetaData.text;
          debugPrint("text>>>>>>>>>>>> $text");
        } else {
          text = 'Aniqlanmagan hudud';
        }
        return text;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getLocationLatLng(String geoCodeText) async {
    try {
      late Response response;
      Map<String, String> qParams = {
        'apikey': '98766a71-a866-47bf-8184-2f9cb48187d2',
        'geocode': geoCodeText,
        'lang': 'uz_UZ',
        'format': 'json',
      };
      debugPrint("QueryParams>>>>>>>>>>$qParams");
      response = await mapApiClient.dio.get(
        mapApiClient.dio.options.baseUrl,
        queryParameters: qParams,
      );
      String text = '';
      if (response.statusCode! == HttpStatus.ok) {
        Geocoding geocoding = Geocoding.fromJson(response.data);

        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0].geoObject
              .point.pos;
          debugPrint("text>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>. $text");
        } else {
          text = 'Aniqlanmagan hudud';
        }
        return text;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

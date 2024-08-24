// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jayraj_task/helper/RestServies/api_helpar.dart';

class RestServices {
  static Future<Response> postData(String endPoint,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    http.Response? response;
    try {
      Uri uri = Uri.parse(ApiHelpar.baseUrl + endPoint);
      response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Response(
          body: response.body,
          statusCode: response.statusCode,
        );
      } else {
        return Response(
          body: response.body,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Response(
        body: response?.body,
        statusCode: response?.statusCode,
      );
    }
  }

  static Future<Response> getData(String endPoint,
      {Map<String, String>? headers}) async {
    http.Response? response;
    try {
      Uri uri = Uri.parse(ApiHelpar.baseUrl + endPoint);
      response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Response(
          body: response.body,
          statusCode: response.statusCode,
        );
      } else {
        return Response(
          body: response.body,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Response(
        body: response?.body,
        statusCode: response?.statusCode,
      );
    }
  }

  static Future<Response> fromData(String endPoint,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiHelpar.baseUrl + endPoint),
      );
      print(body.toString());
      request.fields.addAll(body ?? {});
      if (headers != null) {
        request.headers.addAll(headers);
      }
      http.StreamedResponse response = await request.send();
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        return Response(
          body: result,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 404) {
        var result = await response.stream.bytesToString();
        return Response(
          body: result,
          statusCode: response.statusCode,
        );
      } else {
        var result = await response.stream.bytesToString();
        return Response(
          body: result,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return Response();
    }
  }
}

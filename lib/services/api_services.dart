import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'https://newsapi.org/v2';
  static const String apiKey = "f39698c5ce784e6aa3faa197cc40a5eb";
  Future<List<dynamic>> fetchNewsByCategory(String category) async {
    final response = await http.get(
      Uri.parse("$baseUrl/top-headlines?category=$category&apiKey=$apiKey"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse['articles'] as List<dynamic>;
    } else {
      throw Exception("Failed to load news");
    }
  }

  Future<List<dynamic>> fetchAllNews() async {
    final response = await http.get(
      Uri.parse("$baseUrl/everything?domains=wsj.com&apiKey=$apiKey"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonRessponse = jsonDecode(response.body);
      debugPrint("Response: ${jsonRessponse['articles']}");
      return jsonRessponse['articles'] as List<dynamic>;
    } else {
      throw Exception('Failed to load all news');
    }
  }

  Future<List<dynamic>> searchNews(String query) async {
    final ressponse = await http.get(
      Uri.parse("$baseUrl/everything?q=$query&apiKey=$apiKey"),
    );
    if (ressponse.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(ressponse.body);
      return jsonResponse['articles'] as List<dynamic>;
    } else {
      throw Exception('Failed to search news');
    }
  }
}

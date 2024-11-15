class BaseResponse {
  final String status;
  final String copyright;
  final int num_results;
  final List<BookResponse> results;

  BaseResponse({
    required this.copyright,
   required this.status,
    required this.num_results,
    required this.results
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      copyright: json['copyright'],
      status: json['status'],
      num_results: json['num_results'],

        results: (json['results'] as List)
            .map((item) => BookResponse.fromJson(item))
            .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'copyright': copyright,
      'num_results': num_results,

    };
  }
}




class BookResponse {

  final String url;
  final String publication_dt;
  final String byline;
  final String book_title;
  final String book_author;
  final String summary;
  final String uuid;
  final String uri;




  BookResponse({
    required this.url,
    required this.publication_dt,
    required this.byline,
    required this.book_title,
    required this.book_author,
    required this.summary,
    required this.uuid,
    required this.uri,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      url: json['url'],
      publication_dt: json['publication_dt'],
      byline: json['byline'],
      book_title: json['book_title'],
      book_author: json['book_author'],
      summary: json['summary'],
      uuid: json['uuid'],
      uri: json['uri'],

    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'status': status,
  //     'copyright': copyright,
  //     'num_results': num_results,
  //
  //   };
  // }
}

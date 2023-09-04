import 'package:flip_streak/app_constants/db_constants/book_db_constanst.dart';

class BookModel {

  final String id;
  final String path;
  final String? bookmarks;
  final int lastPage;
  final int totalPages;//
  final String? category;
  final String addDate;
  final String? completeDate;
  final int isComplete;

  BookModel({
    required this.id,
    required this.path,
    this.bookmarks,
    required this.lastPage,
    required this.totalPages,//
    this.category,
    required this.addDate,
    this.completeDate,
    required this.isComplete,
  });


  // Take only the changed value,
  // and assign the rest to the same data
  BookModel copyWith({
    String? id,
    String? path,
    String? bookmarks,
    int? lastPage,
    int? totalPages,//
    String? category,
    String? addDate,
    String? completeDate,
    int? isComplete,
  }){
    return BookModel(
        id: id ?? this.id,
        path: path ?? this.path,
        bookmarks: bookmarks ?? this.bookmarks,
        lastPage: lastPage ?? this.lastPage,
        totalPages: totalPages ?? this.totalPages,//
        category: category ?? this.category,
        addDate: addDate ?? this.addDate,
        completeDate: completeDate ?? this.completeDate,
        isComplete: isComplete ?? this.isComplete,);
  }


  // Assign map to model variables
  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map[columnBookId],
      path: map[columnPath],
      bookmarks: map[columnBookmark],
      lastPage: map[columnLastPage],
      totalPages: map[columnTotalPages],//
      category: map[columnCategory],
      addDate: map[columnAddDate],
      completeDate: map[columnCompleteDate],
      isComplete: map[columnIsComplete],
    );
  }

  // Get map from model
  Map<String, dynamic> toMap() {
    return {
      columnBookId: id,
      columnPath: path,
      columnBookmark: bookmarks,
      columnLastPage: lastPage,
      columnTotalPages: totalPages,//
      columnCategory: category,
      columnAddDate: addDate,
      columnCompleteDate: completeDate,
      columnIsComplete: isComplete,
    };
  }
}
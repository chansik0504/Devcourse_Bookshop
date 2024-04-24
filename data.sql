INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("콩쥐 팥쥐", 4, 0, "ebook", 4, "콩팥..", "콩심은데 콩나고..", "김콩팥", 100, "목차입니다.", 20000, "2023-12-07");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("용궁에 간 토끼", 5, 1, "종이책", 5, "깡충..", "용왕님 하이..", "김거북", 100, "목차입니다.", 20000, "2023-10-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("해님달님", 15, 2, "ebook", 6, "동앗줄..", "황금 동앗줄..!", "김해님", 100, "목차입니다.", 20000, "2023-07-16");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("장화홍련전", 80, 0, "ebook", 7, "기억이 안나요..", "장화와 홍련이?..", "김장화", 100, "목차입니다.", 20000, "2023-03-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("견우와 직녀", 8, 1, "ebook", 8, "오작교!!", "칠월 칠석!!", "김다리", 100, "목차입니다.", 20000, "2023-02-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("효녀 심청", 12, 0, "종이책", 9, "심청아..", "공양미 삼백석..", "김심청", 100, "목차입니다.", 20000, "2023-01-15");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("혹부리 영감", 22, 2, "ebook", 10, "노래 주머니..", "혹 두개 되버림..", "김영감", 100, "목차입니다.", 20000, "2023-06-05");

SELECT * FROM books LEFT JOIN category ON books.category_id = category.id;

SELECT * FROM books LEFT JOIN category ON books.category_id = category.id WHERE books.id=1;

// 좋아요
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 2);
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 3);
INSERT INTO likes (user_id, liked_book_id) VALUES (3, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (4, 4);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 2);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 3);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 5);

// 좋아요 삭제
DELETE FROM likes WHERE user_id=1 AND liked_book_id=3;

SELECT *, (SELECT count(*) FROM likes WHERE liked_book_id=books.id) AS likes FROM books;

SELECT EXISTS (SELECT * FROM likes WHERE user_id=1 AND liked_book_id=1);

SELECT *,
 (SELECT count(*) FROM likes WHERE liked_book_id=books.id) AS likes,
 (SELECT EXISTS (SELECT * FROM likes WHERE user_id=1 AND liked_book_id=1)) AS liked 
 FROM books WHERE books.id=1;

// 장바구니 담기
INSERT INTO cartitems (books_id, quantity, user_id) VALUES (1, 1, 1);

// 장바구니 아이템 목록 조회
SELECT cartitems.id, book_id, title, summary, quantity, price FROM cartitems LEFT JOIN books 
ON cartitems.book_id = books.id;

 // 장바구니 아이템 조회
DELETE FROM cartitems WHERE id=?;

 // 선택한 장바구니 상품 목록 조회
SELECT * FROM cartitems WHERE user_id=1 AND id IN (1,3);

 // 주문하기
 // 배송 정보 입력
INSERT INTO delivery (address, receiver, contact) VALUES ("서울시 중구", "김송아", "010-1234-5678");
const delivery_id = SELECT max(id) FROM delivery;

 // 주문 정보 입력
INSERT INTO orders (book_title, total_quantity, total_price, user_id, delivery_id) VALUES ("어린왕자들", 3, 60000, 1, delivery_id);
const order_id = SELECT max(id) FROM orders;

 // 주문 상세 목록 입력
INSERT INTO orderedbook (order_id, book_id, quantity) VALUES (order_id, 1, 1);
INSERT INTO orderedbook (order_id, book_id, quantity) VALUES (order_id, 3, 2);

SELECT max(id) FROM bookshop.orderedbook;
SELECT last_insert_id();

// 결제된 도서 장바구니 삭제
DELETE FROM cartitems WHERE id IN (1,2,3);
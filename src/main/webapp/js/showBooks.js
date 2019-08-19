function showBooks(rootPath, parent, book) {
	// console.info(book);
	var bookHtml = "";

	bookHtml += "<div class='book-info'>";
	bookHtml += "<a href='" + rootPath + "bookBaseInfoAction!showBook.action?bid=" + book.bid + "'><div class='book-cover'>";
	bookHtml += "<img width='150' height='150' src=" + (jancy.imgServerPath + book.coverImage) + ">";
	bookHtml += "</div><div class='book-name'>" + book.bookName + "</div></a>";
	bookHtml += "<div class='book-author'>" + book.author + "</div>";
	bookHtml += "<div class='book-price'><strong class='book-price-symbol'>$" + book.price;
	bookHtml += "</div>";

	if (book.bookType == "文学") {
		bookHtml += "<span class='book-green'>文学</span>";
	} else if (book.bookType == "计算机技术") {
		bookHtml += "<span class='book-red'>计算机类</span>";
	} else if (book.bookType == "小说") {
		bookHtml += "<span class='book-gray'>小说</span>";
	} else if (book.bookType == "青春") {
		bookHtml += "<span class='book-blue'>青春</span>";
	} else if (book.bookType == "青春文学") {
		bookHtml += "<span class='book-blue'>青春文学</span>";
	} else {
		bookHtml += "<span class='book-blue'>" + book.bookType + "</span>";
	}

	bookHtml += "</div>";

	$('.' + parent).append(bookHtml);

}

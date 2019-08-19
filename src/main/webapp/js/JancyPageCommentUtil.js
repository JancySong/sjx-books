var jancyPageCommentMethod = function(page) {
	$('#totalPage').text("总页数：" + page.totalPage);
	$('#inputPageNum').val(page.currentPage);

	$('.selBtn').removeClass("disabledBtn");
	$('.selBtn').off('click');
	$('.selBtn').removeClass("pointorCls");

	// console.log(page);
	var rows = 2;

	if (page.prevPage == 1 && page.nextPage == 1) {
		$('.selBtn').addClass("disabledBtn");
	} else if (page.currentPage == 1 && page.totalPage != 0) {
		$('.nextPage').addClass("pointorCls");
		$('.lastPage').addClass("pointorCls");
		$('.firstPage').addClass("disabledBtn");
		$('.prevPage').addClass("disabledBtn");
		$('.nextPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.currentPage + 1
			});
		});
		$('.lastPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.totalPage
			});
		});
	} else if (page.currentPage == page.totalPage && page.totalPage != 0) {
		$('.firstPage').addClass("pointorCls");
		$('.prevPage').addClass("pointorCls");
		$('.nextPage').addClass("disabledBtn");
		$('.lastPage').addClass("disabledBtn");
		$('.firstPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : 1
			});
		});
		$('.prevPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.currentPage - 1
			});
		});
	} else if (page.currentPage = 1 && page.totalPage == 0) {
		$('.firstPage').addClass("disabledBtn");
		$('.prevPage').addClass("disabledBtn");
		$('.nextPage').addClass("disabledBtn");
		$('.lastPage').addClass("disabledBtn");
	} else {
		$('.selBtn').addClass("pointorCls");
		$('.nextPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.currentPage + 1
			});
		});
		$('.lastPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.totalPage
			});
		});
		$('.firstPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : 1
			});
		});
		$('.prevPage').on('click', function() {
			getComments({
				"bookId" : param,
				"rows" : rows,
				"page" : page.currentPage - 1
			});
		});
	}
};
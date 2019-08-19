var jancyPageMethod = function(page) {
	$('#totalPage').text("总页数：" + page.totalPage);
	$('#inputPageNum').val(page.currentPage);

	$('.selBtn').removeClass("disabledBtn");
	$('.selBtn').off('click');
	$('.selBtn').removeClass("pointorCls");

	var pageSize = 10;

	if (page.prevPage == 1 && page.nextPage == 1) {
		$('.selBtn').addClass("disabledBtn");
	} else if (page.currentPage == 1 && page.totalPage != 0) {
		$('.nextPage').addClass("pointorCls");
		$('.lastPage').addClass("pointorCls");
		$('.firstPage').addClass("disabledBtn");
		$('.prevPage').addClass("disabledBtn");
		$('.nextPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.currentPage + 1
			});
		});
		$('.lastPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.totalPage
			});
		});
	} else if (page.currentPage == page.totalPage) {
		$('.firstPage').addClass("pointorCls");
		$('.prevPage').addClass("pointorCls");
		$('.nextPage').addClass("disabledBtn");
		$('.lastPage').addClass("disabledBtn");
		$('.firstPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : 1
			});
		});
		$('.prevPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.currentPage - 1
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
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.currentPage + 1
			});
		});
		$('.lastPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.totalPage
			});
		});
		$('.firstPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : 1
			});
		});
		$('.prevPage').on('click', function() {
			getBooks({
				"likeWhere" : param,
				"pageSize" : pageSize,
				"pageIndex" : page.currentPage - 1
			});
		});
	}
};
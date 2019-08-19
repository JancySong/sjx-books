var Constants = function() {
	return {

		LEVEL_ONE : 1,

		LEVEL_TWO : 2,
		// 订单状态
		// 未确认
		ORDER_UNCONFIRMED : 1,
		// 已确认
		ORDER_CONFIRMED : 2,
		// 已配货
		ORDER_DISTRIBUTOIN : 4,
		// 已发货
		ORDER_SHIPPED : 8,
		// 已收货
		ORDER_RECEIVE : 16,
		// 已完成
		ORDER_END : 32,

		// 用户在线状态
		// 离线
		USER_OFF_LINE : 0,
		// 在线
		USER_ON_LINE : 1

	}
}();
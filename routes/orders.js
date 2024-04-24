// 박성률

const express = require('express');
const router = express.Router();
const { order, getOrders, getOrderDetail } = require('../controller/orderController');

router.use(express.json());

router.post('/', order); // 주문 하기
router.get('/', getOrders); // 주문 목록 조회
router.delete('/:id', getOrderDetail); // 주문 상세 조회

module.exports = router;
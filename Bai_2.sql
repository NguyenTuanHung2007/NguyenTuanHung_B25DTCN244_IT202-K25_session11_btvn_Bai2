DROP PROCEDURE IF EXISTS AddInventory;
DELIMITER //
CREATE PROCEDURE AddInventory(IN p_item_id INT, IN p_quantity INT)
BEGIN
    IF p_quantity > 0 THEN
        UPDATE Inventory
        SET stock_quantity = stock_quantity + p_quantity
        WHERE item_id = p_item_id;
        SELECT CONCAT('Thành công: Đã nhập thêm ', p_quantity, ' vào mã vật tư ', p_item_id) AS Message;
    ELSE
        SELECT 'Lỗi: Số lượng nhập kho không hợp lệ (phải lớn hơn 0). Thao tác đã bị hủy.' AS Message;
    END IF;
END
// DELIMITER ;

-- Sau lệnh này, số lượng tồn kho của item_id 10 sẽ bị giảm đi 500 đơn vị thay vì tăng lên
CALL AddInventory(10, -500);
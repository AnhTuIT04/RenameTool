# REANME TOOL
- License: AnhTuIT04
- Verison: 1.0.0

# Hướng dẫn sử dụng

## Bước 1:
Đưa đường dẫn của các folder chứa các file cần đổi tên vào file ```folders.txt``` (mỗi đường dẫn nằm trên một hàng, không chứa các kí tự đặc biệt.

## Bước 2: 
Nếu muốn tùy chỉnh cách đánh tên cho các file (ví dụ: ```ảnh 1.png```, ```ảnh 2.png```, ... hoặc ```1 hình.png```, ```2 hình.png```, ... hoăc ```ảnh 1 hình.png```, ```ảnh 2 hình.png```, ...) thì tham khảo bước sau:
- Mở file ```prefix_postfix.txt```, nếu muốn áp dung cùng một cách đánh tên cho tất cả folder thì chỉ nhập dòng đầu tiên, theo cú pháp sau:
```
	Dòng 1:"<prefix>" "<posfix>"
```
- Nếu muốn áp dung cách đánh tên cho từng folder riêng biệt thì nhập theo cú pháp sau:
```
	Dòng 1:*
	Dòng 2:"<prefix1>" "<posfix1>"
	Dòng 3:"<prefix2>" "<posfix2>"
	...
```
### Lưu ý 1:
Nếu chọn cách đánh tên cho từng folder thì số dòng trong file ```folders.txt``` phải bằng với số dòng trong file ```prefix_postfix.txt``` (không tính dòng đầu tiên), mỗi dòng trong file ```prefix_postfix.txt``` sẽ sẽ quy định cách đặt tên cho một folder trong file ```folders.txt```. Ví dụ dòng 1 trong file ```folders.txt``` và dòng 2 trong file ```prefix_postfix.txt``` sẽ là 1 cặp, cách đặt tên được quy định trong dòng 2 của file ```prefix_postfix.txt``` sẽ áp dung cho folder được lưu ở dòng 1 của file ```folders.txt``` và cứ tương tự như vậy cho các dòng khác.
### Lưu ý 2:
Trong trường hợp không muốn cấu hình việc đặt tên mà chỉ muốn đánh tên theo mặc định (```1.png```, ```2.png```, ...) thì chỉ cần thay các chổ tương ứng bằng kí tự ```~``` (tham khảo ví dụ).
### Lưu ý 3:
Thay thế các ```prefix``` và ```posfix``` bằng các chuỗi bạn muốn, nếu không muốn có ```prefix``` hoặc ```posfix``` thì thay thế bằng kí tự ```~``` và không được bỏ trống (tham khảo ví dụ). Chuỗi ```prefix``` và ```posfix``` không được chứa các ký tự đặc biệt.

## Bước3: 
Nháy đúp vào file ```runner.bat``` để tiến hành đổi tên.

# Các ví dụ cho file ```prefix_postfix.txt```
## Đánh tên theo mặc định, áp dụng cho tất cả folder
```
"~" "~"
```

## Tùy chỉnh cách đánh tên, áp dụng cho tất cả folder
- Nếu muốn đánh tên theo dạng  ```ảnh 1.png```, ```ảnh 2.png```, ...
```
"ảnh " "~"
```
- Nếu muốn đánh tên theo dạng ```1 hình.png```, ```2 hình.png```, ...
```
"~" " hình"
```
- Nếu muốn đánh tên theo dạng ```ảnh 1 hình.png```, ```ảnh 2 hình.png```, ...
```
"ảnh " "hình"
```
## Tùy chỉnh cách đánh tên cho từng folder
- Nếu trong file ```folders.txt``` có 2 folder ```A``` và ```B```, muốn thư mục ```A``` và ```B``` có cách đánh tên khác nhau
```
*
"file " " của folder A"
"file " " của folder B"
```
Như vậy các file trong folder ```A``` sẽ được đặt tên theo dạng ```file 1 của folder A.png```, ```file 2 của folder A.png```, ... Các file trong folder ```B``` sẽ được đặt tên theo dạng ```file 1 của folder B.png```, ```file 2 của folder B.png```, ...
- Nếu trong file ```folders.txt``` có 3 folder ```A```, ```B``` và ```C```, muốn thư mục ```A```, ```B``` và ```C``` có cách đánh tên khác nhau (có thể khuyết prefix hoặc postfix hoặc cả 2)
```
*
"thư mục a, file " "~"
"~" " file của thư mục b"
"~" "~"
```
Như vậy các file trong folder ```A``` sẽ được đặt tên theo dạng ```thư mục a, file 1.png```, ```thư mục a, file 2.png```, ... Các file trong folder ```B``` sẽ được đặt tên theo dạng ```1 file của thư mục b.png```, ```2 file của thư mục b.png```, ... Các file trong folder ```C``` sẽ được đặt tên theo dạng ```1.png```, ```2.png```, ...
# MyStore - ASP.NET MVC 5 + Entity Framework 6

Bài tập website bán hàng theo tài liệu Web Backend đã cung cấp. Project nhắm .NET Framework 4.8, ASP.NET MVC 5 và Entity Framework 6; phù hợp mở/chỉnh sửa trong Visual Studio 2022/2026 nếu đã cài workload ASP.NET and web development và targeting pack .NET Framework 4.8.

## 1. Tạo cơ sở dữ liệu
1. Mở SQL Server Management Studio.
2. Mở `Database/MyStore.sql`, chọn đúng instance SQL Server và Execute.
3. Script tạo database `MyStore`, các bảng, quan hệ, tài khoản Admin mẫu và dữ liệu sản phẩm mẫu.

## 2. Kết nối SQL Server
Mở `Web.config`, sửa `Data Source=.\SQLEXPRESS` theo máy bạn:
- SQL Express: `Data Source=TENMAY\SQLEXPRESS`
- Default instance: `Data Source=localhost`

## 3. Mở và chạy
1. Mở `MaSV_LTW_MyStore.sln` bằng Visual Studio.
2. Restore NuGet packages (EntityFramework 6.4.4, ASP.NET MVC 5.2.9).
3. Đặt project `MaSV_LTW_MyStore` làm startup project.
4. Build Solution, sau đó nhấn Ctrl+F5 hoặc F5.

## 4. Tài khoản thử nghiệm
- Admin: `admin`
- Mật khẩu: `admin123`
- Khách hàng: tạo qua trang Đăng ký.

## 5. Chức năng đã dựng
- Trang chủ và danh sách sản phẩm.
- Xem chi tiết sản phẩm, lọc theo danh mục, tìm kiếm theo tên/mô tả/danh mục, sắp xếp giá và tên, phân trang.
- Đăng ký, đăng nhập, đăng xuất, xem thông tin cá nhân.
- Giỏ hàng theo Session, cập nhật/xóa số lượng, đặt hàng, xem lịch sử mua hàng.
- Khu vực Admin có kiểm tra role: CRUD danh mục, CRUD sản phẩm, tìm sản phẩm, xem đơn hàng.

## Lưu ý quan trọng
- Đây là project mẫu học tập. Mật khẩu hiện được lưu dạng văn bản để bám cấu trúc database được cung cấp; không dùng thiết kế này cho website thực tế. Website triển khai thật cần hash mật khẩu, xác thực/ủy quyền đầy đủ, chống CSRF cho mọi thao tác thay đổi dữ liệu, xác thực đầu vào và bảo vệ tài khoản.
- Tài liệu gốc ghi `ProductDecription` (thiếu chữ s). Project và SQL giữ nguyên tên cột để tương thích với `database2024.txt`.
- Một số chức năng mở rộng trong slide như upload ảnh, CRUD tài khoản Admin/khách hàng, chỉnh sửa hồ sơ và chi tiết từng đơn hàng chưa hoàn thiện đầy đủ trong bản này; nên kiểm thử và bổ sung theo yêu cầu chấm điểm của giảng viên.


## Khôi phục thư viện trên Visual Studio 2022/2026
1. Giải nén toàn bộ thư mục vào một đường dẫn mới (không chép đè lên thư mục cũ).
2. Mở `MaSV_LTW_MyStore.sln`.
3. Nhấp phải Solution → Restore NuGet Packages. Nếu chưa tự khôi phục, mở Package Manager Console và chạy `Update-Package -reinstall` sau khi kiểm tra `App.config`.
4. Chọn Build → Rebuild Solution.
5. Nếu chạy web, dùng IIS Express và cấu hình chuỗi kết nối trong `Web.config` cho SQL Server đang cài trên máy.

Lưu ý: gói NuGet không được đóng gói trong ZIP; Visual Studio cần internet để tải các thư viện cần thiết.

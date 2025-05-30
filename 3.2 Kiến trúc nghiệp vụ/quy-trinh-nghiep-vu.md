# Quy trình nghiệp vụ

## Tổng quan

Công ty có **8 quy trình nghiệp vụ** chính (BP001-BP008) bao trùm toàn bộ hoạt động kinh doanh:

| Quy trình | Tên quy trình                   | Phạm vi                                     | Tần suất     |
| --------- | ------------------------------- | ------------------------------------------- | ------------ |
| BP001     | Bán hàng trực tiếp tại cửa hàng | Từ đón khách đến hoàn thành giao dịch       | Hàng ngày    |
| BP002     | Bán hàng trực tuyến             | Từ nhận đơn online đến giao hàng thành công | Hàng ngày    |
| BP003     | Mua hàng và nhập kho            | Từ dự báo nhu cầu đến nhập kho hoàn thành   | Hàng tuần    |
| BP004     | Quản lý kho hàng                | Các hoạt động hàng ngày trong quản lý kho   | Hàng ngày    |
| BP005     | Tư vấn và chăm sóc khách hàng   | Từ tiếp nhận yêu cầu đến hoàn thành hỗ trợ  | Hàng ngày    |
| BP006     | Xử lý khiếu nại                 | Từ tiếp nhận khiếu nại đến giải quyết       | Theo yêu cầu |
| BP007     | Marketing và truyền thông       | Từ lập kế hoạch đến đánh giá hiệu quả       | Hàng tháng   |
| BP008     | Quản lý tài chính               | Các hoạt động kế toán và tài chính          | Hàng ngày    |

## Quy trình cấp 0: Tổng quan hệ thống

```mermaid
graph TD
    A[Khách hàng] --> B[Tiếp nhận yêu cầu]
    B --> C{Loại yêu cầu}
    C -->|Mua hàng| D[Quy trình bán hàng]
    C -->|Tư vấn| E[Quy trình tư vấn]
    C -->|Khiếu nại| F[Quy trình CSKH]

    G[Nhà cung cấp] --> H[Quy trình mua hàng]
    H --> I[Quy trình quản lý kho]
    I --> D

    D --> J[Giao hàng & Thanh toán]
    E --> K[Chuyển đổi thành bán hàng]
    K --> D
    F --> L[Giải quyết vấn đề]

    style A fill:#ff6b6b
    style G fill:#4ecdc4
    style D fill:#45b7d1
    style H fill:#45b7d1
    style I fill:#45b7d1
```

## BP001: Quy trình bán hàng trực tiếp tại cửa hàng

### Mô tả tổng quan

- **Mục đích**: Xử lý giao dịch bán hàng trực tiếp tại cửa hàng
- **Phạm vi**: Từ khi khách hàng đến cửa hàng đến khi hoàn thành giao dịch
- **Dịch vụ nghiệp vụ**: BS003 (Tư vấn sản phẩm), BS004 (Xử lý đơn hàng), BS005 (Thanh toán)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Khách hàng đến cửa hàng] --> B[NV tiếp đón]
    B --> C[Tìm hiểu nhu cầu]
    C --> D[Tư vấn sản phẩm]
    D --> E{KH quyết định mua?}
    E -->|Có| F[Chọn sản phẩm]
    E -->|Không| G[Cảm ơn & tiễn khách]
    F --> H[Kiểm tra tồn kho]
    H --> I{Có đủ hàng?}
    I -->|Có| J[Tính tiền]
    I -->|Không| K[Đề xuất sản phẩm thay thế]
    K --> E
    J --> L[Thanh toán]
    L --> M[Xuất hóa đơn]
    M --> N[Đóng gói hàng]
    N --> O[Giao hàng cho KH]
    O --> P[Hoàn thành giao dịch]

    style A fill:#ff6b6b
    style P fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP001.svg)

### Thông tin chi tiết

- **Thời gian**: 15-30 phút/giao dịch
- **Tần suất**: 20-30 giao dịch/ngày
- **Actor chính**: Nhân viên bán hàng
- **Actor hỗ trợ**: Quản lý cửa hàng
- **Điểm kiểm soát**:
  - Kiểm tra tồn kho trước khi xác nhận bán
  - Xác nhận thanh toán trước khi xuất hóa đơn
- **KPI**: Tỷ lệ chuyển đổi 70%, Thời gian phục vụ ≤ 30 phút

## BP002: Quy trình bán hàng trực tuyến

### Mô tả tổng quan

- **Mục đích**: Xử lý đơn hàng từ các kênh trực tuyến
- **Phạm vi**: Từ khi nhận đơn hàng online đến khi giao hàng thành công
- **Dịch vụ nghiệp vụ**: BS004 (Xử lý đơn hàng), BS007 (Xuất kho), BS009 (Vận tải)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Nhận đơn hàng online] --> B[Kiểm tra thông tin đơn hàng]
    B --> C{Đơn hàng hợp lệ?}
    C -->|Không| D[Liên hệ KH để xác nhận]
    C -->|Có| E[Kiểm tra tồn kho]
    D --> C
    E --> F{Có đủ hàng?}
    F -->|Không| G[Thông báo hết hàng cho KH]
    F -->|Có| H[Xác nhận đơn hàng với KH]
    G --> I[Đề xuất sản phẩm thay thế]
    I --> J{KH đồng ý?}
    J -->|Không| K[Hủy đơn hàng]
    J -->|Có| H
    H --> L[Chuẩn bị hàng hóa]
    L --> M[Đóng gói]
    M --> N[Lập phiếu giao hàng]
    N --> O[Giao cho vận tải]
    O --> P[Giao hàng cho KH]
    P --> Q[Xác nhận giao hàng thành công]
    Q --> R[Thanh toán COD/CK]
    R --> S[Hoàn thành đơn hàng]

    style A fill:#3498db
    style S fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP002.svg)

### Thông tin chi tiết

- **Thời gian**: 1-2 ngày làm việc
- **Tần suất**: 10-15 đơn/ngày
- **Actor chính**: Nhân viên bán hàng, Nhân viên kho, Nhân viên vận tải
- **Điểm kiểm soát**:
  - Xác nhận đơn hàng qua điện thoại
  - Kiểm tra hàng hóa trước khi đóng gói
  - Xác nhận giao hàng thành công
- **KPI**: Tỷ lệ giao hàng thành công 95%, Thời gian xử lý ≤ 24h

## BP003: Quy trình mua hàng và nhập kho

### Mô tả tổng quan

- **Mục đích**: Đảm bảo cung ứng đủ hàng hóa cho hoạt động kinh doanh
- **Phạm vi**: Từ dự báo nhu cầu đến nhập kho hoàn thành
- **Dịch vụ nghiệp vụ**: BS010 (Lựa chọn NCC), BS011 (Đặt hàng NCC), BS006 (Nhập kho)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Dự báo nhu cầu hàng hóa] --> B[Phân tích tồn kho hiện tại]
    B --> C[Xác định hàng cần nhập]
    C --> D[Lựa chọn nhà cung cấp]
    D --> E[So sánh giá cả & chất lượng]
    E --> F[Lập đơn đặt hàng]
    F --> G[Phê duyệt đơn hàng]
    G --> H[Gửi đơn hàng cho NCC]
    H --> I[Theo dõi tiến độ giao hàng]
    I --> J[NCC giao hàng]
    J --> K[Nhận và kiểm tra hàng]
    K --> L{Hàng đúng quy cách?}
    L -->|Không| M[Từ chối nhận & báo NCC]
    L -->|Có| N[Ký xác nhận nhận hàng]
    M --> O[Yêu cầu NCC giao lại]
    O --> J
    N --> P[Nhập kho hệ thống]
    P --> Q[Sắp xếp hàng trong kho]
    Q --> R[Cập nhật tồn kho]
    R --> S[Thanh toán cho NCC]
    S --> T[Hoàn thành nhập kho]

    style A fill:#f39c12
    style T fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP003.svg)

### Thông tin chi tiết

- **Thời gian**: 3-7 ngày
- **Tần suất**: 2-3 lần/tuần
- **Actor chính**: Nhân viên mua hàng, Nhân viên kho, Quản lý kho
- **Actor hỗ trợ**: Phó GĐ Vận hành Backend, Kế toán
- **Điểm kiểm soát**:
  - Phê duyệt đơn hàng trước khi gửi NCC
  - Kiểm tra chất lượng và số lượng khi nhận hàng
  - Xác nhận nhập kho đúng quy trình
- **KPI**: Độ chính xác đơn hàng 98%, Thời gian chu kỳ ≤ 7 ngày

## BP004: Quy trình quản lý kho hàng

### Mô tả tổng quan

- **Mục đích**: Duy trì và kiểm soát tồn kho hiệu quả
- **Phạm vi**: Các hoạt động hàng ngày trong quản lý kho
- **Dịch vụ nghiệp vụ**: BS006 (Nhập kho), BS007 (Xuất kho), BS008 (Kiểm kê)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Bắt đầu ngày làm việc] --> B[Kiểm kê đầu ca]
    B --> C[Cập nhật tồn kho vào hệ thống]
    C --> D[Xử lý phiếu xuất kho]
    D --> E[Chuẩn bị hàng theo đơn]
    E --> F[Kiểm tra chất lượng hàng xuất]
    F --> G[Đóng gói và giao cho vận tải]
    G --> H[Cập nhật xuất kho]
    H --> I[Xử lý nhập kho mới]
    I --> J[Kiểm tra hàng nhập]
    J --> K[Sắp xếp vào vị trí kho]
    K --> L[Cập nhật nhập kho]
    L --> M[Kiểm tra mức tồn kho]
    M --> N{Có hàng dưới mức tối thiểu?}
    N -->|Có| O[Thông báo bộ phận mua hàng]
    N -->|Không| P[Kiểm kê cuối ca]
    O --> P
    P --> Q[Báo cáo tồn kho cuối ngày]
    Q --> R[Hoàn thành ca làm việc]

    style A fill:#3498db
    style R fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP004.svg)

### Thông tin chi tiết

- **Thời gian**: Liên tục trong giờ làm việc
- **Tần suất**: Hàng ngày
- **Actor chính**: Nhân viên kho, Quản lý kho
- **Điểm kiểm soát**:
  - Kiểm kê đầu ca và cuối ca
  - Kiểm tra chất lượng hàng xuất kho
  - Báo cáo tồn kho định kỳ
- **KPI**: Độ chính xác tồn kho 99%, Thời gian xuất kho ≤ 30 phút

## BP005: Quy trình tư vấn và chăm sóc khách hàng

### Mô tả tổng quan

- **Mục đích**: Cung cấp dịch vụ tư vấn chuyên nghiệp cho khách hàng
- **Phạm vi**: Từ tiếp nhận yêu cầu tư vấn đến hoàn thành hỗ trợ
- **Dịch vụ nghiệp vụ**: BS003 (Tư vấn sản phẩm)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Nhận yêu cầu tư vấn] --> B[Phân loại loại khách hàng]
    B --> C{Loại KH}
    C -->|Cá nhân/Hobby| D[Tư vấn cơ bản]
    C -->|Chuyên nghiệp| E[Tư vấn chuyên sâu]
    D --> F[Hướng dẫn sản phẩm phù hợp]
    E --> G[Phân tích nhu cầu chi tiết]
    G --> H[Đề xuất giải pháp toàn diện]
    F --> I[Trình bày giá cả]
    H --> I
    I --> J{KH quan tâm?}
    J -->|Có| K[Chuyển sang quy trình bán hàng]
    J -->|Không| L[Cung cấp thông tin tham khảo]
    L --> M[Lưu thông tin KH tiềm năng]
    M --> N[Theo dõi chăm sóc định kỳ]
    K --> O[Hoàn thành tư vấn]
    N --> O

    style A fill:#e74c3c
    style O fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP005.svg)

### Thông tin chi tiết

- **Thời gian**: 15-45 phút tùy mức độ phức tạp
- **Tần suất**: 15-20 yêu cầu/ngày
- **Actor chính**: Nhân viên bán hàng, Chuyên gia sản phẩm
- **Điểm kiểm soát**:
  - Đánh giá độ hài lòng của khách hàng
  - Theo dõi tỷ lệ chuyển đổi từ tư vấn sang bán hàng
- **KPI**: Tỷ lệ chuyển đổi 40%, Điểm hài lòng ≥ 4.5/5

## BP006: Quy trình xử lý khiếu nại

### Mô tả tổng quan

- **Mục đích**: Giải quyết khiếu nại và duy trì mối quan hệ với khách hàng
- **Phạm vi**: Từ tiếp nhận khiếu nại đến giải quyết hoàn thành

### Quy trình chi tiết

```mermaid
graph TD
    A[Nhận khiếu nại KH] --> B[Ghi nhận thông tin chi tiết]
    B --> C[Phân loại mức độ nghiêm trọng]
    C --> D{Mức độ}
    D -->|Nhẹ| E[NV xử lý trực tiếp]
    D -->|Vừa| F[Quản lý cửa hàng xử lý]
    D -->|Nặng| G[Leo thang lên cấp cao]
    E --> H[Đề xuất giải pháp]
    F --> H
    G --> I[Phó GĐ can thiệp]
    I --> J[Đề xuất giải pháp đặc biệt]
    H --> K{KH đồng ý?}
    J --> K
    K -->|Không| L[Tìm giải pháp thay thế]
    L --> K
    K -->|Có| M[Thực hiện giải pháp]
    M --> N[Theo dõi kết quả]
    N --> O[Xác nhận KH hài lòng]
    O --> P[Đóng khiếu nại]
    P --> Q[Phân tích nguyên nhân]
    Q --> R[Cải thiện quy trình]

    style A fill:#e74c3c
    style R fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP006.svg)

### Thông tin chi tiết

- **Thời gian**: 1-5 ngày tùy mức độ phức tạp
- **Tần suất**: 2-5 khiếu nại/tuần
- **Actor chính**: Nhân viên bán hàng, Quản lý cửa hàng
- **Điểm kiểm soát**:
  - Thời gian phản hồi khiếu nại ≤ 2h
  - Xác nhận khách hàng hài lòng với giải pháp
- **KPI**: Tỷ lệ giải quyết thành công 95%, Thời gian xử lý ≤ 3 ngày

## BP007: Quy trình marketing và truyền thông

### Mô tả tổng quan

- **Mục đích**: Xây dựng thương hiệu và thu hút khách hàng
- **Phạm vi**: Từ lập kế hoạch marketing đến đánh giá hiệu quả
- **Dịch vụ nghiệp vụ**: BS001 (Nghiên cứu thị trường), BS002 (Sáng tạo nội dung)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Lập kế hoạch marketing] --> B[Nghiên cứu thị trường]
    B --> C[Xác định đối tượng mục tiêu]
    C --> D[Phát triển thông điệp]
    D --> E[Sáng tạo nội dung]
    E --> F[Thiết kế materials]
    F --> G[Phê duyệt nội dung]
    G --> H{Kênh truyền thông}
    H -->|Online| I[Đăng social media]
    H -->|Offline| J[In ấn quảng cáo]
    H -->|Event| K[Tổ chức sự kiện]
    I --> L[Monitor tương tác]
    J --> M[Phân phối materials]
    K --> N[Thực hiện sự kiện]
    L --> O[Thu thập feedback]
    M --> O
    N --> O
    O --> P[Phân tích hiệu quả]
    P --> Q[Báo cáo kết quả]
    Q --> R[Tối ưu hóa chiến dịch]

    style A fill:#9b59b6
    style R fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP007.svg)

### Thông tin chi tiết

- **Thời gian**: 1-4 tuần/chiến dịch
- **Tần suất**: 2-3 chiến dịch/tháng
- **Actor chính**: Nhân viên Marketing, Nhân viên thiết kế
- **Actor hỗ trợ**: Phó GĐ Marketing & Kinh doanh
- **Điểm kiểm soát**:
  - Phê duyệt nội dung trước khi phát hành
  - Đánh giá ROI của chiến dịch
- **KPI**: ROI ≥ 300%, Tỷ lệ tương tác ≥ 5%

## BP008: Quy trình quản lý tài chính

### Mô tả tổng quan

- **Mục đích**: Quản lý dòng tiền và đảm bảo tính minh bạch tài chính
- **Phạm vi**: Các hoạt động kế toán và tài chính hàng ngày
- **Dịch vụ nghiệp vụ**: BS005 (Thanh toán), BS014 (Kế toán thuế)

### Quy trình chi tiết

**Biểu đồ flow chart**

```mermaid
graph TD
    A[Thu thập chứng từ] --> B[Kiểm tra tính hợp lệ]
    B --> C[Phân loại chứng từ]
    C --> D{Loại giao dịch}
    D -->|Thu| E[Ghi sổ doanh thu]
    D -->|Chi| F[Ghi sổ chi phí]
    D -->|Thuế| G[Xử lý kế toán thuế]
    E --> H[Cập nhật công nợ]
    F --> H
    G --> I[Khai báo thuế]
    H --> J[Đối chiếu ngân hàng]
    I --> J
    J --> K[Lập báo cáo tài chính]
    K --> L[Kiểm tra và đối chiếu]
    L --> M[Trình lãnh đạo phê duyệt]
    M --> N[Lưu trữ hồ sơ]

    style A fill:#f39c12
    style N fill:#2ecc71
```

**Biểu đồ BPMN**

![Biểu đồ BPMN](./bpmn/BP008.svg)

### Thông tin chi tiết

- **Thời gian**: Hàng ngày và định kỳ
- **Tần suất**: Liên tục
- **Actor chính**: Kế toán tổng hợp, Kế toán thuế, Kế toán trưởng
- **Điểm kiểm soát**:
  - Kiểm tra chứng từ gốc
  - Đối chiếu số dư ngân hàng
  - Phê duyệt báo cáo tài chính
- **KPI**: Độ chính xác 100%, Đúng thời hạn báo cáo

## Tổng hợp các điểm kiểm soát quan trọng

| Quy trình          | Điểm kiểm soát chính | Tần suất kiểm soát | Người chịu trách nhiệm |
| ------------------ | -------------------- | ------------------ | ---------------------- |
| Bán hàng trực tiếp | Kiểm tra tồn kho     | Mỗi giao dịch      | NV Bán hàng            |
| Bán hàng online    | Xác nhận đơn hàng    | Mỗi đơn hàng       | NV Bán hàng            |
| Mua hàng           | Kiểm tra chất lượng  | Mỗi lô hàng        | NV Kho                 |
| Quản lý kho        | Kiểm kê tồn kho      | Hàng ngày          | Quản lý kho            |
| Tài chính          | Đối chiếu ngân hàng  | Hàng ngày          | Kế toán trưởng         |
| Khiếu nại          | Thời gian phản hồi   | Mỗi khiếu nại      | QL Cửa hàng            |

## Các vấn đề trong quy trình hiện tại

### Tồn tại các điểm yếu

1. **Quản lý thủ công**: Sử dụng Excel và giấy tờ nhiều
2. **Thiếu tích hợp**: Các bộ phận làm việc độc lập
3. **Khó theo dõi**: Không có hệ thống báo cáo tự động
4. **Lỗi con người**: Sai sót trong nhập liệu và tính toán
5. **Phản hồi chậm**: Thời gian xử lý khiếu nại lâu
6. **Thiếu chuẩn hóa**: Quy trình chưa được chuẩn hóa hoàn toàn

### Nhu cầu cải thiện

1. **Tự động hóa**: Giảm thiểu công việc thủ công
2. **Tích hợp dữ liệu**: Kết nối các bộ phận và quy trình
3. **Báo cáo real-time**: Thông tin cập nhật liên tục
4. **Kiểm soát chất lượng**: Giảm thiểu sai sót
5. **Cải thiện trải nghiệm**: Phục vụ khách hàng tốt hơn
6. **Chuẩn hóa quy trình**: Đảm bảo tính nhất quán

## Ma trận quy trình và dịch vụ nghiệp vụ

| Quy trình | Dịch vụ nghiệp vụ liên quan | Bộ phận chính |
| --------- | --------------------------- | ------------- |
| BP001     | BS003, BS004, BS005         | Vận hành      |
| BP002     | BS004, BS007, BS009         | Vận hành, Kho |
| BP003     | BS010, BS011, BS006         | Mua hàng, Kho |
| BP004     | BS006, BS007, BS008         | Kho           |
| BP005     | BS003                       | Vận hành      |
| BP006     | Liên quan BS003, BS004      | Vận hành      |
| BP007     | BS001, BS002                | Marketing     |
| BP008     | BS005, BS014, BS015         | Tài chính     |

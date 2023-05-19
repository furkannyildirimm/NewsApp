# NYTimes Haber Uygulaması

Bu proje, NYTimes API'sini kullanarak Swift dilinde bir haber uygulaması geliştirmek için yapılmıştır. Uygulama, NYTimes'in sağladığı haberleri alır ve kullanıcılara gösterir.

## Özellikler

- Ana sayfada en son haberleri görüntüler.
- Kategorilere göre haber filtreleme.
- Haber başlıklarına tıklayarak haber detaylarını görüntüleme.
- Dünyadaki haberler için listelenmiş şekilde bulunan haberleri arama özelliği ile haberleri anahtar kelimeye göre filtreleme.

## Tasarım Deseni: MVC (Model-View-Controller)

Bu projede, Model-View-Controller (MVC) tasarım desenini kullanmayı tercih ettik. MVC, uygulamanın mantıksal bileşenlerini ayrı bölmelerde organize etmemize olanak tanır.

- **Model**: Uygulama veri ve iş mantığını temsil eder. Verilerin saklandığı ve işlendiği yerdir.
- **View**: Kullanıcı arayüzünü temsil eder. Verilerin gösterildiği ve kullanıcının etkileşimde bulunduğu bileşendir.
- **Controller**: Model ve View arasında iletişimi sağlar. Kullanıcı etkileşimini alır, modeli günceller ve görünümü güncelleyerek kullanıcıya geri bildirim sağlar.

MVC deseni, uygulamanın parçalarını ayrı tutarak sürdürülebilirliği, bakımı ve yeniden kullanılabilirliği artırır.

## Gereksinimler

- Swift 5.0 veya üzeri
- Xcode 13.0 veya üzeri

## Ekran Görüntüsü

NewsAPP            | Iphone 14 Pro
:-------------------------:|:-------------------------:
![](https://github.com/furkannyildirimm/FurkanYildirim_HW2/blob/main/GIF/1.gif)  |  ![](https://github.com/furkannyildirimm/FurkanYildirim_HW2/blob/main/GIF/2.gif)

## Kullanılan Teknolojiler

- Swift: iOS uygulama geliştirmek için kullanılan bir programlama dili.
- NYTimes API: NYTimes'in sağladığı haberlere erişmek için kullanılan bir haber API'si.
- Alamofire: HTTP istekleri yapmak için kullanılan bir Swift kütüphanesi.
- SDWebImage: Uzaktan görüntüleri önbelleğe almak ve yüklemek için kullanılan bir Swift kütüphanesi.

## İletişim
- Eğer herhangi bir sorunuz, öneriniz veya geri bildiriminiz varsa, bize şu e-posta adresinden ulaşabilirsiniz: [furkannyildirimm@hotmail.com]


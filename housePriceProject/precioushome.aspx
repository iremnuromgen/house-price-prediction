 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="precioushome.aspx.cs" Inherits="housePriceProject.precioushome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Precious Home</title>
    <link href="style.css" rel="stylesheet" />
    <script src="https://unpkg.com/scrollreveal"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- İlk Kısım -->
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="#">PH</a>
                </div>
            </div>
            <div class="center">
                <h1>Precious Home</h1>
                <h2>'Yuvanızın Değerini Bilin'</h2>
            </div>
        </div>
        <!-- İlk Kısım Bitti -->

        <!-- İkinci Kısım -->

        <div class="container-two">
            <div class="headerbar">
                <div class="header">
                    <h1>Precious Home</h1>
                </div>
            </div>
            <div class="center-two">
                <div class="center-image anime-left">
                    <img src="Images/image.jpg" alt="Home" />
                </div>
                <div class="center-text anime-right">
                    <h1>Precious Home Nasıl Kullanılır?</h1>
                    <p>
                        Precious Home hesaplama aracı, evinizin tahmini değerine kolay ve pratik bir şekilde ulaşmanızı sağlar.<br />
                        Ev sahipleri ; ülke, şehir, adres, yatak odası sayısı, sahile yakınlık, metrekare vb bilgileri girerek<br />
                        Precious Home'un sağladığı verilerin analiz edilmesiyle evlerinin ortalama değerini öğrenebilir.
                    </p>
                </div>
            </div>
        </div>

        <!-- İkinci Kısım Bitti -->

        <!-- Üçüncü Kısım -->
        <div class="container-three">
            <div class="headerbar-two">
                <div class="header-two">
                    <h1>Ev Fiyatını Tahmin Etmeye Başlayalım!</h1>
                </div>
            </div>
            <div class="middle-box">
                <div class="prediction-box">
                        <div class="box-left">
                            <div class="input-box-view">
                                <label for="Hview">Görüntülenme : </label>
                                <asp:Label ID="Hview" runat="server" Text="-" CssClass="boxView"/>
                            </div>
                            <div class="input-box">
                                <label for="Hdate">Tarih : </label>
                                <asp:TextBox Type="date" id="Hdate" runat="server" CssClass="boxDate"/>
                            </div>
                            <div class="input-box">
                                <label for="Hbed">Yatak Odası Sayısı : </label>
                                <asp:TextBox type="number" id="Hbed" name="Hbed" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hbath">Banyo Sayısı : </label>
                                <asp:TextBox type="number" id="Hbath" name="Hbath" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hnet">Net Metrekare : </label>
                                <asp:TextBox type="number" id="Hnet" name="Hnet" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hbrut">Brüt Metrekare : </label>
                                <asp:TextBox type="number" id="Hbrut" name="Hbrut" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hfloor">Kat Sayısı : </label>
                                <asp:TextBox type="number" id="Hfloor" name="Hfloor" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hwater">Sahile Yakınlık : </label>
                                <asp:TextBox type="number" id="Hwater" name="Hwater" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hcon">Evin Durumu : </label>
                                <asp:TextBox type="number" id="Hcon" name="Hcon" placeholder="Örn : 1 - 5" runat="server"/>
                            </div>
                        </div>
                        <div class="box-right">
                            <div class="input-box">
                                <label for="Habove">Üst Kat Metrekare : </label>
                                <asp:TextBox type="number" id="Habove" name="Habove" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hbasement">Bodrum Kat Metrekare : </label>
                                <asp:TextBox type="number" id="Hbasement" name="Hbasement" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hbuilt">İnşa Yılı : </label>
                                <asp:TextBox type="number" id="Hbuilt" name="Hbuilt" runat="server"/>
                            </div>
                            <div class="input-box">
                                <label for="Hreno">Restorasyon Yılı : </label>
                                <asp:TextBox type="number" id="Hreno" name="Hreno" runat="server"/>
                            </div>
                            <div class="input-box country">
                                <label for="Hcountry">Ülke : </label>
                                <asp:DropDownList class="dropdown-country" id="Hcountry" name="Hcountry" runat="server" CssClass="boxCountry">
                                    <asp:ListItem value="country1">USA</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="input-box city">
                                <label for="Hcity">Şehir : </label>
                                <asp:DropDownList class="dropdown-city" id="Hcity" name="Hcity" runat="server" CssClass="boxCity">
                                    <asp:ListItem Text="Shoreline" Value ="city1" />
                                    <asp:ListItem Text="Seattle" Value ="city2" />
                                    <asp:ListItem Text="Kent" Value ="city3" />
                                    <asp:ListItem Text="Bellevue" Value ="city4" />
                                    <asp:ListItem Text="Redmond" Value ="city5" />
                                    <asp:ListItem Text="Maple Valley" Value ="city6" />
                                    <asp:ListItem Text="North Bend" Value ="city7" />
                                    <asp:ListItem Text="Lake Forest Park" Value ="city8" />
                                    <asp:ListItem Text="Sammamish" Value ="city9" />
                                    <asp:ListItem Text="Auburn" Value ="city10" />
                                    <asp:ListItem Text="Des Moines" Value ="city11" />
                                    <asp:ListItem Text="Bothell" Value ="city12" />
                                    <asp:ListItem Text="Federal Way" Value ="city13" />
                                    <asp:ListItem Text="Kirkland" Value ="city14" />
                                    <asp:ListItem Text="Issaquah" Value ="city15" />
                                    <asp:ListItem Text="Woodinville" Value ="city16" />
                                    <asp:ListItem Text="Normandy Park" Value ="city17" />
                                    <asp:ListItem Text="Fall City" Value ="city18" />
                                    <asp:ListItem Text="Renton" Value ="city19" />
                                    <asp:ListItem Text="Carnation" Value ="city20" />
                                    <asp:ListItem Text="Snoqualmie" Value ="city21" />
                                    <asp:ListItem Text="Duvall" Value ="city22" />
                                    <asp:ListItem Text="Burien" Value ="city23" />
                                    <asp:ListItem Text="Covington" Value ="city24" />
                                    <asp:ListItem Text="Inglewood-Finn Hill" Value ="city25" />
                                    <asp:ListItem Text="Kenmore" Value ="city26" />
                                    <asp:ListItem Text="Newcastle" Value ="city27" />
                                    <asp:ListItem Text="Mercer Island" Value ="city28" />
                                    <asp:ListItem Text="Black Diamond" Value ="city29" />
                                    <asp:ListItem Text="Ravensdale" Value ="city30" />
                                    <asp:ListItem Text="Clyde Hill" Value ="city31" />
                                    <asp:ListItem Text="Algona" Value ="city32" />
                                    <asp:ListItem Text="Skykomish" Value ="city33" />
                                    <asp:ListItem Text="Tukwila" Value ="city34" />
                                    <asp:ListItem Text="Vashon" Value ="city35" />
                                    <asp:ListItem Text="Yarrow Point" Value ="city36" />
                                    <asp:ListItem Text="SeaTac" Value ="city37" />
                                    <asp:ListItem Text="Medina" Value ="city38" />
                                    <asp:ListItem Text="Enumclaw" Value ="city39" />
                                    <asp:ListItem Text="Snoqualmie Pass" Value ="city40" />
                                    <asp:ListItem Text="Pacific" Value ="city41" />
                                    <asp:ListItem Text="Beaux Arts Village" Value ="city42" />
                                    <asp:ListItem Text="Preston" Value ="city43" />
                                    <asp:ListItem Text="Milton" Value ="city44" />
                                </asp:DropDownList>
                            </div>
                            <div class="input-box">
                                <label for="Hzip">Eyalet Kodu : </label>
                                <asp:TextBox type="text" id="Hzip" name="Hzip" placeholder="Örn: WA 98155" runat="server"/>
                            </div>
                            <div class="input-box-adress">
                                <label for="Hadress">Adres : </label>
                                <asp:TextBox id="Hadress" name="Hadress" runat="server" TextMode="MultiLine" rows="3" placeholder="Örn : 18810 Densmore Ave N' '709 W Blaine St"></asp:TextBox>
                            </div>
                            <div class="input-box-btn">
                                <asp:Button id="btn" runat="server" Text="Tahmin Et" CssClass="btnGuess" OnClick="buttonGuess"/>
                            </div>
                            <div class="input-box-guess">
                                <label for="Hpguess">Tahmin : </label>
                                <asp:Label id="Hpguess" runat="server" Text="-" CssClass="boxGuess"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <!-- Javascript Kodları -->
        <script>
            window.sr = ScrollReveal();

            sr.reveal('.anime-left', {
                origin: 'left',
                duration: 1000,
                distance: '25rem',
                delay: 300
            })

            sr.reveal('.anime-right', {
                origin: 'right',
                duration: 1000,
                distance: '25rem',
                delay: 300
            })
        </script>
        <!-- Javascript Kodları Bitti -->
    </form>
</body>
</html>

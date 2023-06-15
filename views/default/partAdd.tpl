<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
            <h2 class="text-center mb-4">Додати запчастину</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="partName">
                        Назва запчастини [глобальний код]
                        <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="form-control" id="partName" name="partName" placeholder="Введіть назву запчастини" required>
                </div>
                <div class="form-group">
                    <label for="partPrice">
                        Ціна запчастини
                        <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="partPrice" name="partPrice" placeholder="Введіть ціну запчастини" required>
                        <span class="input-group-text">грн.</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="partQuantity">
                        Кількість на складі
                        <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="partQuantity" name="partQuantity" placeholder="Введіть кількість запчастин на складі" required>
                        <span class="input-group-text">шт.</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="partBrand">
                        Марка
                        <span class="text-danger">*</span>
                    </label>
                    <select class="form-control" id="partBrand" name="partBrand" required>
                        <option value="">Оберіть марку</option>
                        <option value="all">Універсальна</option>
                        <option value="Audi">Audi</option>
                        <option value="BMW">BMW</option>
                        <option value="Chevrolet">Chevrolet</option>
                        <option value="Ford">Ford</option>
                        <option value="Honda">Honda</option>
                        <option value="Hyundai">Hyundai</option>
                        <option value="Kia">Kia</option>
                        <option value="Mazda">Mazda</option>
                        <option value="Mercedes-Benz">Mercedes-Benz</option>
                        <option value="Nissan">Nissan</option>
                        <option value="Opel">Opel</option>
                        <option value="Peugeot">Peugeot</option>
                        <option value="Renault">Renault</option>
                        <option value="Subaru">Subaru</option>
                        <option value="Toyota">Toyota</option>
                        <option value="Volkswagen">Volkswagen</option>
                        <option value="Volvo">Volvo</option>
                        <option value="Lada">Lada</option>
                        <option value="Skoda">Skoda</option>
                    </select>
                </div>


                <div class="form-group">
                    <label for="image1">
                        Картинка запчастини 1
                        <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="form-control" id="image1" name="partImage1" placeholder="Введіть посилання на першу картинку" required>
                </div>

                <div class="form-group">
                    <label for="image2">
                        Картинка запчастини 2
                        <span class ="text-muted">[необов'язково]</span>
                    </label>
                    <input type="text" class="form-control" id="image2" name="partImage2" placeholder="Введіть посилання на другу картинку">
                </div>

                <div class="form-group">
                    <label for="image3">
                        Картинка запчастини 3
                        <span class ="text-muted">[необов'язково]</span>
                    </label>
                    <input type="text" class="form-control" id="image3" name="partImage3" placeholder="Введіть посилання на третю картинку">
                </div>


                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" id="addToList" name="addToList">
                    <label class="form-check-label" for="addToList">Додати одразу в асортимент</label>
                </div>

                <button type="submit" class="btn btn-primary">Додати запчастину</button>
                <a href="/" class="btn btn-secondary">Повернутись</a>
            </form>
        </div>
    </div>
</div>
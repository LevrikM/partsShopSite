<div class="container">
    <h1>Замовлення запчастини</h1>
    <form action="http://auto/part/order/" method="POST">
        <div class="form-group">
            Назва запчастини: <span id="partName"><b>{$partName}</b></span>
            <input type="hidden" name="orderPartName" value="{$partName}"/>
        </div>
        <div class="form-group">
            Код товару: <span id="partName"><b>{$partCode}</b></span>
            <input type="hidden" name="orderPartCode" value="{$partCode}"/>
        </div>
        <div id="infoUser" class="form-group">
        </div>
        {literal}
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    let userEmail = localStorage.getItem("userEmail");
                    if (userEmail !== null) {
                        let formGroup = document.createElement("div");
                        formGroup.className = "form-group";
                        formGroup.innerHTML = "Ваша пошта: <span id='userEmail'><b>" + userEmail + "</b></span>";

                        let hiddenInput = document.createElement("input");
                        hiddenInput.type = "hidden";
                        hiddenInput.name = "userEmail";
                        hiddenInput.value = userEmail;

                        formGroup.appendChild(hiddenInput);
                        let targetElement = document.querySelector("#infoUser");
                        targetElement.insertAdjacentElement("beforeend", formGroup);
                    }
                    else {
                        let phoneInputGroup = document.createElement("div");
                        phoneInputGroup.className = "form-group";

                        let phoneLabel = document.createElement("label");
                        phoneLabel.innerHTML = "Номер телефону: " +
                            "<span class='text-danger'>*</span>";
                        phoneInputGroup.appendChild(phoneLabel);

                        let phoneInputWrapper = document.createElement("div");
                        phoneInputWrapper.className = "input-group";

                        let phonePrefix = document.createElement("div");
                        phonePrefix.className = "input-group-prepend";

                        let phonePrefixText = document.createElement("span");
                        phonePrefixText.className = "input-group-text";
                        phonePrefixText.innerHTML = "+380";

                        phonePrefix.appendChild(phonePrefixText);
                        phoneInputWrapper.appendChild(phonePrefix);

                        let phoneInput = document.createElement("input");
                        phoneInput.type = "number";
                        phoneInput.name = "userPhone";
                        phoneInput.className = "form-control";
                        phoneInput.required = true;
                        phoneInputWrapper.appendChild(phoneInput);

                        phoneInputGroup.appendChild(phoneInputWrapper);

                        let targetElement = document.querySelector("#infoUser");
                        targetElement.insertAdjacentElement("beforeend", phoneInputGroup);
                    }
                });
            </script>

        {/literal}
        <div class="form-group">
            <label for="partQuantity">
                Кількість:
                <span class="text-danger">*</span>
                <span class="text-muted">[доступно {$partQuantity}шт.]</span>
            </label>
            <div class="input-group">
                <input type="number" class="form-control" id="partQuantity" name="orderPartQuantity" placeholder="Введіть кількість яку хочете замовити" min="1" max="{$partQuantity}" required>
                <span class="input-group-text">шт.</span>
            </div>
        </div>
        <div class="form-group">
            <label for="address">
                Адреса:
                <span class="text-danger">*</span>
            </label>
            <input type="text" class="form-control" id="address" name="addressOrder" placeholder="Введіть адресу" required>
        </div>
        <div class="form-group">
            <label for="description">Опис:</label>
            <textarea class="form-control" id="description" name="descriptionOrder" rows="4"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Замовити</button>
    </form>
</div>
{if $rsPartInfo|@count == 0}
    <div class="container text-center">
        <h4>
            <i class="fas fa-bug" style="color: #6e0c0c;"></i>
            Помилка!
        </h4>
        <h4>Вибачте за незручності</h4>
    </div>
{/if}

{foreach $rsPartInfo as $item}
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <div class="row mt-4">
                    <h1 id="itemTitle">
                        {$item["name"]}
                    </h1>
                    <i class="fa-regular fa-pen-to-square" style="display: none" id="editNameIcon"></i>

                </div>
                <div id="editSection" style="display: none; color: white;">
                    <input type="text" id="editInput" value="{$item['name']}">
                    <a class="btn btn-primary" id="confirmButton">Підтвердити</a>
                    <a class="btn btn-secondary" id="cancelButton">Скасувати</a>
                </div>
                {if $item["brand"] != ""}
                    {if $item["brand"] == "all"}
                        <p class="lead">Універсальне</p>
                    {else}
                        <p class="lead">Підходить для: {$item["brand"]}</p>
                    {/if}
                {/if}

                <p id="showQuantity" style="display: none;" class="lead">Кількість на складі: <b>{$item["quantity"]}шт.</b></p>

                <hr>
                <p>Код товару: {$item["part_code"]}</p>
                <hr>

                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        {if $item["part_image"] != ""}
                            <div class="carousel-item active">
                                <img src="{$item['part_image']}" class="d-block mx-auto" alt="Part image" style="width: 400px; height: 400px;">
                            </div>
                        {/if}

                        {if $item["part_image2"] != ""}
                            <div class="carousel-item">
                                <img src="{$item['part_image2']}" class="d-block mx-auto" alt="Part image 2" style="width: 400px; height: 400px;">
                            </div>
                        {/if}

                        {if $item["part_image3"] != ""}
                            <div class="carousel-item">
                                <img src="{$item['part_image3']}" class="d-block mx-auto" alt="Part image 3" style="width: 400px; height: 400px;">
                            </div>
                        {/if}
                    </div>

                    {if $item["part_image2"] != "" || $item["part_image3"] != ""}
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="visually-hidden">
                                <i class="fas fa-arrow-left"></i>
                            </span>
                        </button>

                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="visually-hidden">
                                <i class="fas fa-arrow-right"></i>
                            </span>
                        </button>
                    {/if}
                </div>
                <hr>
                <div>
                    <i class="fa-regular fa-pen-to-square" style="display: none" id="editPriceIcon"></i>
                    <span class="lead">
                        Ціна: <b>
                    </span>
                    <div id="editSectionPrice" style="display: none; color: white;">
                        <input type="text" id="editInputPrice" value="{$item['price']}">
                        <a class="btn btn-primary" id="confirmButtonPrice">Підтвердити</a>
                        <a class="btn btn-secondary" id="cancelButtonPrice">Скасувати</a>
                    </div>
                    <span id="priceTitle" class="lead font-weight-bold">
                        {$item["price"]}
                    </span>
                    <span class="lead">
                        грн.
                    </span>
                </div>
                {if $item["quantity"] > 3}
                    <p class="lead text-success font-weight-bold">Є в наявності</p>
                {elseif $item["quantity"] > 0}
                    <p class="lead text-warning font-weight-bold">Закінчується</p>
                {else}
                    <p class="lead text-danger font-weight-bold">Немає в наявності</p>
                {/if}
                <div class="mt-4 text-center">
                    <div id="editStatus" class="mb-4" style="display: none; color: white;">
                        {if $item['status'] == 0}
                            <a class="btn btn-primary" href="/part/partstatus/?part_id={$item['id']}&status=1">Відображати в списку</a>
                        {else}
                            <a class="btn btn-secondary" href="/part/partstatus/?part_id={$item['id']}&status=0">Прибрати з відображення</a>
                        {/if}
                    </div>

                    {if {$item["quantity"]} != "0"}
                        <a href="/part/order/?part_name={$item["name"]}&part_code={$item['part_code']}&quantity={$item['quantity']}" class="btn btn-primary">Замовити</a>
                    {/if}
                    <a href="/" class="btn btn-secondary">Повернутись</a>
                </div>
            </div>
        </div>
    </div>
{/foreach}

<script>
    let isAdmin = localStorage.getItem("admin");

    if (isAdmin === "1") {
        const editNameIcon = document.getElementById("editNameIcon");
        const editPriceIcon = document.getElementById("editPriceIcon");
        const itemTitle = document.getElementById("itemTitle");
        const priceTitle = document.getElementById("priceTitle");
        const editSection = document.getElementById("editSection");
        const editSectionPrice = document.getElementById("editSectionPrice");
        const editInput = document.getElementById("editInput");
        const editInputPrice = document.getElementById("editInputPrice");
        const confirmButton = document.getElementById("confirmButton");
        const confirmButtonPrice = document.getElementById("confirmButtonPrice");
        const cancelButton = document.getElementById("cancelButton");
        const cancelButtonPrice = document.getElementById("cancelButtonPrice");
        const showQuantity = document.getElementById("showQuantity");

        editNameIcon.style.display = "inline-block";
        editPriceIcon.style.display = "inline-block";
        editStatus.style.display = "block";
        showQuantity.style.display = "block";
        editNameIcon.addEventListener("click", () => {
            editNameIcon.style.display = "none";
            itemTitle.style.display = "none";
            editSection.style.display = "block";
            editInput.focus();
        });

        editPriceIcon.addEventListener("click", () => {
            editPriceIcon.style.display = "none";
            priceTitle.style.display = "none";
            editSectionPrice.style.display = "block";
            editInputPrice.focus();
        });

        confirmButton.addEventListener("click", () => {
            const newValue = editInput.value;
            confirmButton.href = "http://auto/part/editname/?part_id={$item['id']}&new_name=" + newValue;
            itemTitle.textContent = newValue;
            itemTitle.style.display = "block";
            editSection.style.display = "none";
            editNameIcon.style.display = "inline-block";
        });

        confirmButtonPrice.addEventListener("click", () => {
            const newValue = editInputPrice.value;
            confirmButtonPrice.href = "http://auto/part/editprice/?part_id={$item['id']}&new_price=" + newValue;
            priceTitle.textContent = newValue;
            priceTitle.style.display = "block";
            editSectionPrice.style.display = "none";
            editPriceIcon.style.display = "inline-block";
        });

        cancelButton.addEventListener("click", () => {
            itemTitle.style.display = "block";
            editSection.style.display = "none";
            editNameIcon.style.display="inline-block"
        });

        cancelButtonPrice.addEventListener("click", () => {
            priceTitle.style.display = "inline-block";
            editSectionPrice.style.display = "none";
            editPriceIcon.style.display="inline-block"
        });
    }
</script>




<style>
    .carousel-control-prev,
    .carousel-control-next {
        position: absolute;
        top: 50%;
        width: 40px;
        height: 40px;
        background-color: #696969;
        border: none;
        outline: none;
        cursor: pointer;
    }

    #editNameIcon:hover{
        cursor: pointer;
    }
    #editPriceIcon:hover{
        cursor: pointer;
    }


    .carousel-control-prev {
        left: 0;
    }

    .carousel-control-next {
        right: 0;
    }

    .carousel-control-prev:hover {
        color:black;
    }

    .carousel-control-next:hover {
       color: black;
    }

</style>

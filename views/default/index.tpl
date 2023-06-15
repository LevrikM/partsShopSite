<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="/part/find/" method="GET">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="nameFind" placeholder="Введіть назву запчастини" aria-label="Пошук" required>
                    <span class="input-group-append">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <div class="mt-3 text-center">
        <h2>
            Наші запчастини
            <i id="hideParts" style="display: none" class="fa-solid fa-minus"></i>
            <i id="showParts" style="display: none" class="fa-solid fa-plus"></i>
        </h2>
    </div>


</div>


<div class="container" >
    <div id="visibleParts">
        {if ({$action} == "show")}
            <div class="row justify-content-center mb-3">
                <div class="col-md-6">
                    <div class="btn-group" role="group" aria-label="Сортування">
                        <a id="qasc" href="/index/sort/?field=quantity&order=asc" class="btn btn-primary">Сортувати за кількістю (за зростанням)</a>
                        <a id="qdesc" href="/index/sort/?field=quantity&order=desc" class="btn btn-primary">Сортувати за кількістю (за спаданням)</a>
                        <a id="pasc" href="/index/sort/?field=price&order=asc" class="btn btn-primary">Сортувати за ціною (за зростанням)</a>
                        <a id="pdesc" href="/index/sort/?field=price&order=desc" class="btn btn-primary">Сортувати за ціною (за спаданням)</a>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center mb-3">
                <span id="sortMethod" class="text-muted"></span>
            </div>
        {/if}
        <div class="row mt-3">
            {foreach $rsParts as $item}
                {if $item["status"] != 0}
                    <div class="col-12 col-md-4 mb-3">
                        <div class="card h-100">
                            <img class="card-img-top" src="{$item['part_image']}" alt="Part image">
                            <div class="card-body">
                                <h2 class="card-title">{$item["name"]}</h2>
                                <p class="card-text"><b>{$item["price"]}</b> грн.</p>
                            </div>
                            <a href="/part/show/?part-code={$item["part_code"]}" class="btn btn-primary mt-auto">Дізнатись більше про запчастину</a>
                            {if $item["brand"] != ""}
                                <div class="card-footer text-muted">
                                    {if $item["brand"] == "all"}
                                        <span>Універсальне</span>
                                    {else}
                                        <span>Підходить для: {$item["brand"]}</span>
                                    {/if}
                                </div>
                            {/if}
                            <div class="card-footer text-muted">
                                {if $item["quantity"] > 3}
                                    <span class="text-success font-weight-bold">Є в наявності</span>
                                {elseif $item["quantity"] > 0}
                                    <span class="text-warning font-weight-bold">Закінчується</span>
                                {else}
                                    <span class="text-danger font-weight-bold">Немає в наявності</span>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            {/foreach}
        </div>
    </div>



    <div id ="showHiddenParts" style="display: none">
            <div class="mt-3 text-center">
                <h2>Приховані запчастини</h2>
            </div>
        <div class="row mt-3">
            {foreach $rsParts as $item}
                {if $item["status"] == 0}
                    <div class="col-12 col-md-4 mb-3">
                        <div class="card h-100">
                            <img class="card-img-top" src="{$item['part_image']}" alt="Part image">
                            <div class="card-body">
                                <h2 class="card-title">{$item["name"]}</h2>
                                <p class="card-text"><b>{$item["price"]}</b> грн.</p>
                            </div>
                            <a href="/part/show/?part-code={$item["part_code"]}" class="btn btn-primary mt-auto">Дізнатись більше про запчастину</a>
                            {if $item["brand"] != ""}
                                <div class="card-footer text-muted">
                                    {if $item["brand"] == "all"}
                                        <span>Універсальне</span>
                                    {else}
                                        <span>Підходить для: {$item["brand"]}</span>
                                    {/if}
                                </div>
                            {/if}
                            <div class="card-footer text-muted">
                                {if $item["quantity"] > 3}
                                    <span class="text-success font-weight-bold">Є в наявності</span>
                                {elseif $item["quantity"] > 0}
                                    <span class="text-warning font-weight-bold">Закінчується</span>
                                {else}
                                    <span class="text-danger font-weight-bold">Немає в наявності</span>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            {/foreach}
        </div>
</div>

<style>
    .card {
        width: 260px;
    }
    .card-img-top {
        width: 250px;
        height: 210px;

    }

    #hideParts,
    #showParts{
        cursor: pointer;
    }
</style>

<script>
    let isAdmin = localStorage.getItem("admin");

    if (isAdmin === "1") {
        const showHiddenParts = document.getElementById("showHiddenParts");
        const showParts = document.getElementById("showParts");
        const hideParts = document.getElementById("hideParts");
        const mainParts = document.getElementById("visibleParts");

        showHiddenParts.style.display = "block"
        {if ({$action} == "show")}
            hideParts.style.display = "inline-block";
        {/if}

        hideParts.addEventListener("click", () => {
            showParts.style.display = "inline-block";
            hideParts.style.display = "none";
            mainParts.style.display = "none";
        });

        showParts.addEventListener("click", () => {
            hideParts.style.display = "inline-block";
            showParts.style.display = "none";
            mainParts.style.display = "block";
        });
    }


    {if ({$action} == "show")}
        if("{$field}" === "price" && "{$order}" === "asc"){
            $('#sortMethod').text("відсортовано за ціною(за зростанням)");
            $('#pasc').removeClass("btn-primary").addClass("btn-secondary");
        }
        else  if("{$field}" === "price" && "{$order}" === "desc") {
            $('#sortMethod').text("відсортовано за кількістю(за спаданням)");
            $('#pdesc').removeClass("btn-primary").addClass("btn-secondary");
        }
        else  if("{$field}" === "quantity" && "{$order}" === "asc") {
            $('#sortMethod').text("відсортовано за кількістю(за зростанням)");
            $('#qasc').removeClass("btn-primary").addClass("btn-secondary");
        }
        else{
            $('#sortMethod').text("відсортовано за кількістю(за спаданням)");
            $('#qdesc').removeClass("btn-primary").addClass("btn-secondary");
        }
    {/if}
</script>

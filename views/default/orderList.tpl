<div class="container">
    {if ($action != "user")}
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="/part/orderfind/" method="GET">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name= "order_id" placeholder="Введіть ID замовлення" aria-label="Пошук" required>
                        <span class="input-group-append">
                            <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
    {/if}

    {if ($action == "user")}
        <h2 class="mt-4">Всі замовлення <span class="text-muted">[ID користувача: {$userId}]</span></h2>
    {elseif ($action == "all")}
        <h2 class="mt-4">Всі замовлення <span class="text-muted">[зареєстровані користувачі]</span></h2>
    {elseif ($action == "find")}
        <h2 class="mt-4">Замовлення <span class="text-muted">[за пошуком]</span></h2>
    {/if}
    <table class="table text-center">
        <thead>
        <tr>
            {if ($action != "user")}
                <th>ID користувача</th>
            {/if}
            <th>Код замовлення</th>
            <th>Код товару</th>
            <th>Кількість</th>
            <th>Дата замовлення</th>
            <th>Опис</th>
            <th>Статус</th>
            <th>Статус<br>Доставляється</th>
            <th>Статус<br>Виконано</th>
            <th>Видалення</th>
        </tr>
        </thead>
        <tbody id="orderList">
        {foreach $orders as $order}
            {if ($order['user_id']) && ({$order['deleted'] == 0})}
                <tr>
                    {if ($action != "user")}
                        <td>
                            <a href="http://auto/user/cabinet/?userId={$order['user_id']}">
                                {$order['user_id']}
                            </a>
                        </td>
                    {/if}

                    <td>{$order['id']}</td>
                    <td>
                        <a href="http://auto/part/show/?part-code={$order['part_id']}">
                            {$order['part_id']}
                        </a>
                    </td>
                    <td>{$order['quantity']}</td>
                    <td>{$order['order_date']}</td>
                    <td>
                        {if ($order['description'] != "")}
                            {$order['description']}
                        {else}
                            немає
                        {/if}
                    </td>
                    <td>
                        {if ({$order['status']} == 0)}
                            <b>В обробці</b>
                        {elseif ({$order['status']} == 1)}
                            <b>Доставляється</b>
                        {elseif ({$order['status']} == 2)}
                            <b>Завершено</b>
                        {/if}
                    </td>
                    <td>
                        {if ({$order['status']} == 0)}
                           <a href="/part/setstatus/?order_id={$order['id']}&status=1">
                               <i class="fa-solid fa-truck-moving"></i>
                           </a>
                        {else}
                            -
                        {/if}
                    </td>
                    <td>
                        {if ({$order['status']} == 1)}
                            <a href="/part/setstatus/?order_id={$order['id']}&status=2">
                                <i class="fa-solid fa-check"></i>
                            </a>
                        {else}
                            -
                        {/if}
                    </td>
                    <td>
                        {if ({$order['status']} != 1) && ({$order['deleted'] != 1})}
                            <a href="/part/delorder/?order_id={$order['id']}">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        {else}
                            -
                        {/if}
                    </td>
                </tr>
            {/if}
        {/foreach}
        </tbody>
    </table>
    {if ($action == "all")}
        <h2 class="mt-4">Всі замовлення <span class="text-muted">[незареєстровані користувачі]</span></h2>
        <table class="table text-center">
            <thead>
            <tr>
                <th>Телефон користувача</th>
                <th>Код замовлення</th>
                <th>Код товару</th>
                <th>Кількість</th>
                <th>Дата замовлення</th>
                <th>Опис</th>
                <th>Статус</th>
                <th>Статус<br>Доставляється</th>
                <th>Статус<br>Виконано</th>
                <th>Видалення</th>
            </tr>
            </thead>
            <tbody id="orderList">
            {foreach $orders as $order}
                {if (!$order['user_id']) && ({$order['deleted'] == 0})}
                    <tr>
                        <td>{$order['phoneOrder']} </td>
                        <td>{$order['id']}</td>
                        <td>
                            <a href="http://auto/part/show/?part-code={$order['part_id']}">
                                {$order['part_id']}
                            </a>
                        </td>
                        <td>{$order['quantity']}</td>
                        <td>{$order['order_date']}</td>
                        <td>
                            {if ($order['description'] != "")}
                                {$order['description']}
                            {else}
                                немає
                            {/if}
                        </td>
                        <td>
                            {if ({$order['status']} == 0)}
                                <b>В обробці</b>
                            {elseif ({$order['status']} == 1)}
                                <b>Доставляється</b>
                            {elseif ({$order['status']} == 2)}
                                <b>Завершено</b>
                            {/if}
                        </td>
                        <td>
                            {if ({$order['status']} == 0)}
                                <a href="/part/setstatus/?order_id={$order['id']}&status=1">
                                    <i class="fa-solid fa-truck-moving"></i>
                                </a>
                            {else}
                                -
                            {/if}
                        </td>
                        <td>
                            {if ({$order['status']} == 1)}
                                <a href="/part/setstatus/?order_id={$order['id']}&status=2">
                                    <i class="fa-solid fa-check"></i>
                                </a>
                            {else}
                                -
                            {/if}
                        </td>
                        <td>
                            {if ({$order['status']} != 1) && ({$order['deleted'] != 1})}
                                <a href="/part/delorder/?order_id={$order['id']}">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            {else}
                                -
                            {/if}
                        </td>
                    </tr>
                {/if}
            {/foreach}
            </tbody>
        </table>
    {/if}
</div>

<style>
    a{
        font-weight: bold;
        color: #0d0b79;
    }
</style>
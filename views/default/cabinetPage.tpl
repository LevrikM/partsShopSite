<div class="container">
    <h1 class="mt-4">Кабінет користувача</h1>

    <div class="form-group row">
        <label for="userEmail" class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-10 mt-2">
            <span id="userEmail">{$email}</span>
        </div>
    </div>
    <div class="form-group row">
        <label for="userName" class="col-sm-2 col-form-label">Ім'я:</label>
        <div class="col-sm-10 mt-2">
            <span id="userName">{$name}</span>
        </div>
    </div>
    <div class="form-group row">
        <label for="userPhone" class="col-sm-2 col-form-label">Номер телефону:</label>
        <div class="col-sm-10 mt-2">
            <span id="userPhone">{$phone}</span>
        </div>
    </div>

    {if {$orders|@count == 0}}
        <h2 class="mt-4">Поки, немає замовлень закріплених до цього профілю.</h2>
    {else}
        <h2 class="mt-4">Замовлення</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Код замовлення</th>
                <th>Код товару</th>
                <th>Кількість</th>
                <th>Дата замовлення</th>
                <th>Статус</th>
            </tr>
            </thead>
            <tbody id="orderList">
            {foreach $orders as $order}
                <tr>
                    <td>{$order['id']}</td>
                    <td>
                        <a href="http://auto/part/show/?part-code={$order['part_id']}">
                            {$order['part_id']}
                        </a>
                    </td>
                    <td>{$order['quantity']}</td>
                    <td>{$order['order_date']}</td>
                    <td>
                        {if ({$order['status']} == 0)}
                            <b>В обробці</b>
                        {elseif ({$order['status']} == 1)}
                            <b>Доставляється</b>
                        {elseif ({$order['status']} == 2)}
                            <b>Завершено</b>
                        {/if}
                    </td>
                </tr>
            {/foreach}
            </tbody>
        </table>
    {/if}


</div>
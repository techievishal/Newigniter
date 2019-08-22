<div class="table-responsive">
    <table class="table table-borderless">
        <thead>
        <tr>
            <th><?= lang('igniter.user::default.reviews.column_sale_id'); ?></th>
            <th><?= lang('igniter.user::default.reviews.column_sale_type'); ?></th>
            <th><?= lang('igniter.user::default.reviews.column_restaurant'); ?></th>
            <th class="text-center"><?= lang('igniter.user::default.reviews.label_quality'); ?></th>
            <th class="text-center"><?= lang('igniter.user::default.reviews.label_delivery'); ?></th>
            <th class="text-center"><?= lang('igniter.user::default.reviews.label_service'); ?></th>
            <th><?= lang('igniter.user::default.reviews.column_date'); ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if (count($customerReviews)) { ?>
            <?php foreach ($customerReviews as $review) { ?>
                <tr>
                    <td><?= $review->sale_id; ?></td>
                    <td><?= ucwords($review->sale_type); ?></td>
                    <td><?= $review->location->location_name; ?></td>
                    <td class="text-center"><?= array_get($reviewHints, $review->quality); ?></td>
                    <td class="text-center"><?= array_get($reviewHints, $review->delivery); ?></td>
                    <td class="text-center"><?= array_get($reviewHints, $review->service); ?></td>
                    <td><?= day_elapsed($review->date_added); ?></td>
                </tr>
                <tr>
                    <td colspan="999"><?= $review->review_text; ?></td>
                </tr>
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="999"><?= lang('igniter.user::default.reviews.text_empty'); ?></td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>

<div class="pagination-bar text-right">
    <div class="links"><?= $customerReviews->links(); ?></div>
</div>

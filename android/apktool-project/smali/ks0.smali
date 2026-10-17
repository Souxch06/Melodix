.class public final Lks0;
.super Lvz;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lpy0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lks0;->d:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lvz;-><init>(Lpy0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)I
    .locals 1

    .line 1
    iget p0, p0, Lks0;->d:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lqy0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lqy0;

    .line 21
    .line 22
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 25
    .line 26
    add-int/2addr v0, p1

    .line 27
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 28
    .line 29
    :goto_0
    add-int/2addr v0, p0

    .line 30
    return v0

    .line 31
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lqy0;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lqy0;

    .line 46
    .line 47
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 48
    .line 49
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    add-int/2addr v0, p1

    .line 52
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Landroid/view/View;)I
    .locals 2

    .line 1
    iget p0, p0, Lks0;->d:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lqy0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lqy0;

    .line 17
    .line 18
    iget-object v0, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    add-int/2addr p1, v1

    .line 27
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    add-int/2addr p1, v0

    .line 30
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 31
    .line 32
    add-int/2addr p1, v0

    .line 33
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 34
    .line 35
    :goto_0
    add-int/2addr p1, p0

    .line 36
    return p1

    .line 37
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lqy0;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lqy0;

    .line 48
    .line 49
    iget-object v0, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    add-int/2addr p1, v1

    .line 58
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    add-int/2addr p1, v0

    .line 61
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 62
    .line 63
    add-int/2addr p1, v0

    .line 64
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final d(Landroid/view/View;)I
    .locals 2

    .line 1
    iget p0, p0, Lks0;->d:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lqy0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lqy0;

    .line 17
    .line 18
    iget-object v0, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    add-int/2addr p1, v1

    .line 27
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 28
    .line 29
    add-int/2addr p1, v0

    .line 30
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 31
    .line 32
    add-int/2addr p1, v0

    .line 33
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 34
    .line 35
    :goto_0
    add-int/2addr p1, p0

    .line 36
    return p1

    .line 37
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lqy0;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lqy0;

    .line 48
    .line 49
    iget-object v0, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    add-int/2addr p1, v1

    .line 58
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    add-int/2addr p1, v0

    .line 61
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 62
    .line 63
    add-int/2addr p1, v0

    .line 64
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Landroid/view/View;)I
    .locals 1

    .line 1
    iget p0, p0, Lks0;->d:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lqy0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lqy0;

    .line 21
    .line 22
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    sub-int/2addr v0, p1

    .line 27
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 28
    .line 29
    :goto_0
    sub-int/2addr v0, p0

    .line 30
    return v0

    .line 31
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lqy0;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lqy0;

    .line 46
    .line 47
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 48
    .line 49
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    sub-int/2addr v0, p1

    .line 52
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final f()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    iget p0, p0, Lpy0;->n:I

    .line 11
    .line 12
    return p0

    .line 13
    :pswitch_0
    check-cast p0, Lpy0;

    .line 14
    .line 15
    iget p0, p0, Lpy0;->m:I

    .line 16
    .line 17
    return p0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final g()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    iget v0, p0, Lpy0;->n:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lpy0;->z()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    :goto_0
    sub-int/2addr v0, p0

    .line 17
    return v0

    .line 18
    :pswitch_0
    check-cast p0, Lpy0;

    .line 19
    .line 20
    iget v0, p0, Lpy0;->m:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lpy0;->B()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    goto :goto_0

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final h()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lpy0;->z()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :pswitch_0
    check-cast p0, Lpy0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lpy0;->B()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final i()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    iget p0, p0, Lpy0;->l:I

    .line 11
    .line 12
    return p0

    .line 13
    :pswitch_0
    check-cast p0, Lpy0;

    .line 14
    .line 15
    iget p0, p0, Lpy0;->k:I

    .line 16
    .line 17
    return p0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final j()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    iget p0, p0, Lpy0;->k:I

    .line 11
    .line 12
    return p0

    .line 13
    :pswitch_0
    check-cast p0, Lpy0;

    .line 14
    .line 15
    iget p0, p0, Lpy0;->l:I

    .line 16
    .line 17
    return p0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final k()I
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lpy0;->C()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :pswitch_0
    check-cast p0, Lpy0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lpy0;->A()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final l()I
    .locals 2

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    iget v0, p0, Lpy0;->n:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lpy0;->C()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    sub-int/2addr v0, v1

    .line 17
    invoke-virtual {p0}, Lpy0;->z()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    :goto_0
    sub-int/2addr v0, p0

    .line 22
    return v0

    .line 23
    :pswitch_0
    check-cast p0, Lpy0;

    .line 24
    .line 25
    iget v0, p0, Lpy0;->m:I

    .line 26
    .line 27
    invoke-virtual {p0}, Lpy0;->A()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    invoke-virtual {p0}, Lpy0;->B()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    goto :goto_0

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Landroid/view/View;)I
    .locals 2

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Lvz;->c:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast p0, Lpy0;

    .line 11
    .line 12
    check-cast v1, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {p0, p1, v1}, Lpy0;->G(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    iget p0, v1, Landroid/graphics/Rect;->bottom:I

    .line 18
    .line 19
    return p0

    .line 20
    :pswitch_0
    check-cast p0, Lpy0;

    .line 21
    .line 22
    check-cast v1, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1}, Lpy0;->G(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 25
    .line 26
    .line 27
    iget p0, v1, Landroid/graphics/Rect;->right:I

    .line 28
    .line 29
    return p0

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final n(Landroid/view/View;)I
    .locals 2

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Lvz;->c:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast p0, Lpy0;

    .line 11
    .line 12
    check-cast v1, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {p0, p1, v1}, Lpy0;->G(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    iget p0, v1, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    return p0

    .line 20
    :pswitch_0
    check-cast p0, Lpy0;

    .line 21
    .line 22
    check-cast v1, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1}, Lpy0;->G(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 25
    .line 26
    .line 27
    iget p0, v1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    return p0

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final o(I)V
    .locals 1

    .line 1
    iget v0, p0, Lks0;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lvz;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lpy0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lpy0;->L(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    check-cast p0, Lpy0;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lpy0;->K(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

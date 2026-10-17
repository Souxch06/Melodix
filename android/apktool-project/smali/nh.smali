.class public final Lnh;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public final synthetic j:I

.field public k:I

.field public final l:I

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lrh;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lnh;->j:I

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lnh;->m:Ljava/lang/Object;

    .line 21
    iput v0, p0, Lnh;->k:I

    .line 22
    invoke-virtual {p1}, Lrh;->size()I

    move-result p1

    iput p1, p0, Lnh;->l:I

    return-void
.end method

.method public constructor <init>(Lsh;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lnh;->j:I

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lnh;->m:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lnh;->k:I

    .line 26
    invoke-virtual {p1}, Lsh;->size()I

    move-result p1

    iput p1, p0, Lnh;->l:I

    return-void
.end method

.method public constructor <init>(Lxo1;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lnh;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lnh;->m:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lnh;->k:I

    .line 11
    .line 12
    invoke-virtual {p1}, Lxo1;->c()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lnh;->l:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Lnh;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lnh;->k:I

    .line 7
    .line 8
    iget p0, p0, Lnh;->l:I

    .line 9
    .line 10
    if-ge v0, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    return p0

    .line 16
    :pswitch_0
    iget v0, p0, Lnh;->k:I

    .line 17
    .line 18
    iget p0, p0, Lnh;->l:I

    .line 19
    .line 20
    if-ge v0, p0, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    :goto_1
    return p0

    .line 26
    :pswitch_1
    iget v0, p0, Lnh;->k:I

    .line 27
    .line 28
    iget p0, p0, Lnh;->l:I

    .line 29
    .line 30
    if-ge v0, p0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    const/4 p0, 0x0

    .line 35
    :goto_2
    return p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lnh;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lnh;->m:Ljava/lang/Object;

    .line 4
    .line 5
    iget v2, p0, Lnh;->l:I

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lnh;->k:I

    .line 11
    .line 12
    if-ge v0, v2, :cond_0

    .line 13
    .line 14
    add-int/lit8 v2, v0, 0x1

    .line 15
    .line 16
    iput v2, p0, Lnh;->k:I

    .line 17
    .line 18
    check-cast v1, Lxo1;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lxo1;->b(I)B

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :pswitch_0
    iget v0, p0, Lnh;->k:I

    .line 36
    .line 37
    if-ge v0, v2, :cond_1

    .line 38
    .line 39
    add-int/lit8 v2, v0, 0x1

    .line 40
    .line 41
    iput v2, p0, Lnh;->k:I

    .line 42
    .line 43
    check-cast v1, Lsh;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lsh;->h(I)B

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_1
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 55
    .line 56
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :pswitch_1
    iget v0, p0, Lnh;->k:I

    .line 61
    .line 62
    if-ge v0, v2, :cond_2

    .line 63
    .line 64
    add-int/lit8 v2, v0, 0x1

    .line 65
    .line 66
    iput v2, p0, Lnh;->k:I

    .line 67
    .line 68
    check-cast v1, Lrh;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Lrh;->e(I)B

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_2
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 80
    .line 81
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final remove()V
    .locals 0

    .line 1
    iget p0, p0, Lnh;->j:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 9
    .line 10
    .line 11
    throw p0

    .line 12
    :pswitch_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 15
    .line 16
    .line 17
    throw p0

    .line 18
    :pswitch_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.class public Ld0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public final synthetic j:I

.field public k:I

.field public final l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lg0;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Ld0;->j:I

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld0;->l:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/AbstractSet;I)V
    .locals 0

    .line 13
    iput p2, p0, Ld0;->j:I

    iput-object p1, p0, Ld0;->l:Ljava/lang/Object;

    const/4 p1, 0x0

    iput p1, p0, Ld0;->k:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ld0;->j:I

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ld0;->l:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 4

    .line 1
    iget v0, p0, Ld0;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    iget-object v3, p0, Ld0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast v3, Li81;

    .line 11
    .line 12
    iget-object v0, v3, Li81;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Llf2;

    .line 15
    .line 16
    iget p0, p0, Ld0;->k:I

    .line 17
    .line 18
    iget v0, v0, Llf2;->e:I

    .line 19
    .line 20
    if-ge p0, v0, :cond_0

    .line 21
    .line 22
    move v1, v2

    .line 23
    :cond_0
    return v1

    .line 24
    :pswitch_0
    iget p0, p0, Ld0;->k:I

    .line 25
    .line 26
    check-cast v3, Lxn1;

    .line 27
    .line 28
    invoke-virtual {v3}, Lxn1;->c()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {v3}, Lxn1;->b()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    sub-int/2addr v0, v3

    .line 37
    if-ge p0, v0, :cond_1

    .line 38
    .line 39
    move v1, v2

    .line 40
    :cond_1
    return v1

    .line 41
    :pswitch_1
    iget p0, p0, Ld0;->k:I

    .line 42
    .line 43
    check-cast v3, [Ljava/lang/Object;

    .line 44
    .line 45
    array-length v0, v3

    .line 46
    if-ge p0, v0, :cond_2

    .line 47
    .line 48
    move v1, v2

    .line 49
    :cond_2
    return v1

    .line 50
    :pswitch_2
    iget p0, p0, Ld0;->k:I

    .line 51
    .line 52
    check-cast v3, Lg0;

    .line 53
    .line 54
    invoke-virtual {v3}, Lg0;->b()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ge p0, v0, :cond_3

    .line 59
    .line 60
    move v1, v2

    .line 61
    :cond_3
    return v1

    .line 62
    nop

    .line 63
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final next()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Ld0;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Ld0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ld0;->k:I

    .line 9
    .line 10
    add-int/lit8 v2, v0, 0x1

    .line 11
    .line 12
    iput v2, p0, Ld0;->k:I

    .line 13
    .line 14
    check-cast v1, Li81;

    .line 15
    .line 16
    iget-object p0, v1, Li81;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Llf2;

    .line 19
    .line 20
    iget-object v1, p0, Llf2;->d:[I

    .line 21
    .line 22
    aget v0, v1, v0

    .line 23
    .line 24
    and-int/lit8 v0, v0, 0x1f

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Llf2;->d(I)Lre2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :pswitch_0
    iget v0, p0, Ld0;->k:I

    .line 32
    .line 33
    check-cast v1, Lxn1;

    .line 34
    .line 35
    invoke-virtual {v1}, Lxn1;->c()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1}, Lxn1;->b()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    sub-int/2addr v2, v3

    .line 44
    if-ge v0, v2, :cond_0

    .line 45
    .line 46
    iget-object v2, v1, Lxn1;->k:Lyn1;

    .line 47
    .line 48
    invoke-virtual {v1}, Lxn1;->b()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/2addr v1, v0

    .line 53
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    iget-object v2, v2, Lyn1;->j:[Ljava/lang/Object;

    .line 56
    .line 57
    aget-object v1, v2, v1

    .line 58
    .line 59
    iput v0, p0, Ld0;->k:I

    .line 60
    .line 61
    return-object v1

    .line 62
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 63
    .line 64
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 65
    .line 66
    .line 67
    throw p0

    .line 68
    :pswitch_1
    :try_start_0
    check-cast v1, [Ljava/lang/Object;

    .line 69
    .line 70
    iget v0, p0, Ld0;->k:I

    .line 71
    .line 72
    add-int/lit8 v2, v0, 0x1

    .line 73
    .line 74
    iput v2, p0, Ld0;->k:I

    .line 75
    .line 76
    aget-object p0, v1, v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    return-object p0

    .line 79
    :catch_0
    move-exception v0

    .line 80
    iget v1, p0, Ld0;->k:I

    .line 81
    .line 82
    add-int/lit8 v1, v1, -0x1

    .line 83
    .line 84
    iput v1, p0, Ld0;->k:I

    .line 85
    .line 86
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw p0

    .line 96
    :pswitch_2
    invoke-virtual {p0}, Ld0;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    check-cast v1, Lg0;

    .line 103
    .line 104
    iget v0, p0, Ld0;->k:I

    .line 105
    .line 106
    add-int/lit8 v2, v0, 0x1

    .line 107
    .line 108
    iput v2, p0, Ld0;->k:I

    .line 109
    .line 110
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :cond_1
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 116
    .line 117
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 118
    .line 119
    .line 120
    throw p0

    .line 121
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final remove()V
    .locals 1

    .line 1
    iget p0, p0, Ld0;->j:I

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
    const-string v0, "Operation is not supported for read-only collection"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0

    .line 26
    :pswitch_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 27
    .line 28
    const-string v0, "Operation is not supported for read-only collection"

    .line 29
    .line 30
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

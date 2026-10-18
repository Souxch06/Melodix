.class public final Lut1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public final synthetic j:I

.field public k:I

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lut1;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lut1;->l:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lut1;->k:I

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 4

    .line 1
    iget v0, p0, Lut1;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    iget-object v3, p0, Lut1;->l:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast v3, Lrp1;

    .line 11
    .line 12
    iget p0, p0, Lut1;->k:I

    .line 13
    .line 14
    invoke-virtual {v3}, Lrp1;->s()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge p0, v0, :cond_0

    .line 19
    .line 20
    move v1, v2

    .line 21
    :cond_0
    return v1

    .line 22
    :pswitch_0
    check-cast v3, Lxt1;

    .line 23
    .line 24
    iget-object v0, v3, Lxt1;->j:Ljava/lang/String;

    .line 25
    .line 26
    iget p0, p0, Lut1;->k:I

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ge p0, v0, :cond_1

    .line 33
    .line 34
    move v1, v2

    .line 35
    :cond_1
    return v1

    .line 36
    :pswitch_1
    check-cast v3, Lxt1;

    .line 37
    .line 38
    iget-object v0, v3, Lxt1;->j:Ljava/lang/String;

    .line 39
    .line 40
    iget p0, p0, Lut1;->k:I

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-ge p0, v0, :cond_2

    .line 47
    .line 48
    move v1, v2

    .line 49
    :cond_2
    return v1

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic next()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lut1;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lut1;->l:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast v1, Lrp1;

    .line 9
    .line 10
    iget v0, p0, Lut1;->k:I

    .line 11
    .line 12
    invoke-virtual {v1}, Lrp1;->s()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget v3, p0, Lut1;->k:I

    .line 17
    .line 18
    if-ge v0, v2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v0, v3, 0x1

    .line 21
    .line 22
    iput v0, p0, Lut1;->k:I

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Lrp1;->t(I)Lst1;

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
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    add-int/lit8 v0, v0, 0x15

    .line 42
    .line 43
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 44
    .line 45
    .line 46
    const-string v0, "Out of bounds index: "

    .line 47
    .line 48
    invoke-static {v1, v0, v3}, Lx81;->j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p0

    .line 56
    :pswitch_0
    check-cast v1, Lxt1;

    .line 57
    .line 58
    iget-object v0, v1, Lxt1;->j:Ljava/lang/String;

    .line 59
    .line 60
    iget v1, p0, Lut1;->k:I

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-ge v1, v2, :cond_1

    .line 67
    .line 68
    add-int/lit8 v2, v1, 0x1

    .line 69
    .line 70
    new-instance v3, Lxt1;

    .line 71
    .line 72
    iput v2, p0, Lut1;->k:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-direct {v3, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-object v3

    .line 86
    :cond_1
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 87
    .line 88
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 89
    .line 90
    .line 91
    throw p0

    .line 92
    :pswitch_1
    check-cast v1, Lxt1;

    .line 93
    .line 94
    iget-object v0, v1, Lxt1;->j:Ljava/lang/String;

    .line 95
    .line 96
    iget v1, p0, Lut1;->k:I

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-ge v1, v0, :cond_2

    .line 103
    .line 104
    add-int/lit8 v0, v1, 0x1

    .line 105
    .line 106
    new-instance v2, Lxt1;

    .line 107
    .line 108
    iput v0, p0, Lut1;->k:I

    .line 109
    .line 110
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-direct {v2, p0}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-object v2

    .line 118
    :cond_2
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 119
    .line 120
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 121
    .line 122
    .line 123
    throw p0

    .line 124
    nop

    .line 125
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

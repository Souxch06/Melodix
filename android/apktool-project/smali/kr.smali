.class public final synthetic Lkr;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lkr;->j:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3

    .line 1
    iget p0, p0, Lkr;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    packed-switch p0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    check-cast p1, Lxr;

    .line 8
    .line 9
    check-cast p2, Lxr;

    .line 10
    .line 11
    check-cast p1, Ldd;

    .line 12
    .line 13
    iget-object p0, p1, Ldd;->a:Ljava/lang/String;

    .line 14
    .line 15
    check-cast p2, Ldd;

    .line 16
    .line 17
    iget-object p1, p2, Ldd;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :pswitch_0
    check-cast p1, [B

    .line 25
    .line 26
    check-cast p2, [B

    .line 27
    .line 28
    array-length p0, p1

    .line 29
    array-length v1, p2

    .line 30
    if-eq p0, v1, :cond_0

    .line 31
    .line 32
    array-length p0, p1

    .line 33
    array-length p1, p2

    .line 34
    sub-int v0, p0, p1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    move p0, v0

    .line 38
    :goto_0
    array-length v1, p1

    .line 39
    if-ge p0, v1, :cond_2

    .line 40
    .line 41
    aget-byte v1, p1, p0

    .line 42
    .line 43
    aget-byte v2, p2, p0

    .line 44
    .line 45
    if-eq v1, v2, :cond_1

    .line 46
    .line 47
    sub-int v0, v1, v2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    add-int/lit8 p0, p0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    :goto_1
    return v0

    .line 54
    :pswitch_1
    check-cast p1, Ljava/io/File;

    .line 55
    .line 56
    check-cast p2, Ljava/io/File;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget p1, Lxs;->f:I

    .line 63
    .line 64
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0

    .line 81
    :pswitch_2
    check-cast p1, Ljava/io/File;

    .line 82
    .line 83
    check-cast p2, Ljava/io/File;

    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :pswitch_3
    check-cast p1, Ljava/io/File;

    .line 99
    .line 100
    check-cast p2, Ljava/io/File;

    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    .line 107
    .line 108
    .line 109
    move-result-wide p0

    .line 110
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

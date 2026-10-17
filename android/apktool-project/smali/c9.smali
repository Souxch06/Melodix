.class public final Lc9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lo4;
.implements Ln4;
.implements Ljw0;
.implements Lle0;
.implements Lkw0;
.implements Lvz0;


# static fields
.field public static volatile n:Lc9;

.field public static final o:Ljava/lang/Object;

.field public static final p:Ly1;

.field public static final q:Lkr;

.field public static final r:Lbt;

.field public static s:Lc9;

.field public static t:Lc9;


# instance fields
.field public final synthetic j:I

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lc9;->o:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ly1;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, v1}, Ly1;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lc9;->p:Ly1;

    .line 15
    .line 16
    new-instance v0, Lkr;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, v1}, Lkr;-><init>(I)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lc9;->q:Lkr;

    .line 23
    .line 24
    new-instance v0, Lbt;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lc9;->r:Lbt;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 4

    iput p1, p0, Lc9;->j:I

    packed-switch p1, :pswitch_data_0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const-string p1, "    "

    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    .line 73
    const-string p1, "type"

    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    .line 74
    sget-object p1, Lgk;->j:Lgk;

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void

    .line 75
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcn1;

    const-string v0, ""

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {p1, v0, v1, v2, v3}, Lcn1;-><init>(Ljava/lang/String;JLjava/util/HashMap;)V

    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    new-instance p1, Lcn1;

    .line 76
    invoke-direct {p1, v0, v1, v2, v3}, Lcn1;-><init>(Ljava/lang/String;JLjava/util/HashMap;)V

    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    .line 77
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 121
    iput p1, p0, Lc9;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lc9;->j:I

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    .line 113
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    .line 114
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .locals 1

    const/16 v0, 0x16

    iput v0, p0, Lc9;->j:I

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    .line 104
    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/location/LocationManager;)V
    .locals 1

    const/16 v0, 0x18

    iput v0, p0, Lc9;->j:I

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    new-instance v0, Lde1;

    .line 107
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 109
    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    .line 110
    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 62
    iput p4, p0, Lc9;->j:I

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    iput-object p3, p0, Lc9;->l:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ly02;)V
    .locals 4

    const/16 v0, 0x1c

    iput v0, p0, Lc9;->j:I

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, -0x1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 65
    new-instance v0, Ltb1;

    const-string v1, "measurement:api"

    invoke-direct {v0, v1}, Ltb1;-><init>(Ljava/lang/String;)V

    .line 66
    new-instance v1, Lpm1;

    .line 67
    sget-object v2, Lpm1;->j:Ls7;

    sget-object v3, Lta0;->c:Lta0;

    invoke-direct {v1, p1, v2, v0, v3}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 68
    iput-object v1, p0, Lc9;->l:Ljava/lang/Object;

    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbv1;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lc9;->j:I

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 89
    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcn1;)V
    .locals 1

    const/16 v0, 0x19

    iput v0, p0, Lc9;->j:I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    invoke-virtual {p1}, Lcn1;->a()Lcn1;

    move-result-object p1

    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    .line 70
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ler0;Ltb0;Lhv;Ljava/util/Set;)V
    .locals 7

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    iput v0, p0, Lc9;->j:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    .line 11
    .line 12
    iput-object p3, p0, Lc9;->m:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-interface {p4}, Ljava/util/Set;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, [I

    .line 36
    .line 37
    new-instance v1, Ljava/lang/String;

    .line 38
    .line 39
    array-length p3, p2

    .line 40
    const/4 p4, 0x0

    .line 41
    invoke-direct {v1, p2, p4, p3}, Ljava/lang/String;-><init>([III)V

    .line 42
    .line 43
    .line 44
    new-instance v6, Ldb2;

    .line 45
    .line 46
    invoke-direct {v6, v1}, Ldb2;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/4 v4, 0x1

    .line 54
    const/4 v5, 0x1

    .line 55
    const/4 v2, 0x0

    .line 56
    move-object v0, p0

    .line 57
    invoke-virtual/range {v0 .. v6}, Lc9;->G(Ljava/lang/CharSequence;IIIZLj00;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    :goto_1
    return-void
.end method

.method public constructor <init>(Lgy0;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lc9;->j:I

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    .line 92
    new-instance p1, Ldk;

    invoke-direct {p1}, Ldk;-><init>()V

    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    .line 93
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 63
    iput p4, p0, Lc9;->j:I

    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    iput-object p2, p0, Lc9;->l:Ljava/lang/Object;

    iput-object p3, p0, Lc9;->m:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 1

    const/16 v0, 0x12

    iput v0, p0, Lc9;->j:I

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 101
    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x13

    iput v0, p0, Lc9;->j:I

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    new-instance v0, Lxn0;

    const/4 v1, 0x3

    const/4 v2, 0x0

    .line 124
    invoke-direct {v0, v1, v2}, Lxn0;-><init>(IZ)V

    .line 125
    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 126
    iput-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 127
    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1

    const/16 v0, 0xc

    iput v0, p0, Lc9;->j:I

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lc9;->l:Ljava/lang/Object;

    .line 85
    iput-object p2, p0, Lc9;->k:Ljava/lang/Object;

    .line 86
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lc9;->j:I

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Lzs;

    invoke-direct {v0, p1}, Lzs;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 80
    new-instance v0, Lzs;

    invoke-direct {v0, p1}, Lzs;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 81
    invoke-static {p1}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 82
    new-instance p1, Lzs;

    invoke-direct {p1, p2}, Lzs;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm30;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lc9;->j:I

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 96
    iput-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 97
    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqp;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lc9;->j:I

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 117
    new-instance v0, Lmg;

    .line 118
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 120
    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    return-void
.end method

.method public static A(Lf00;Landroid/text/Editable;IIZ)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_19

    .line 3
    .line 4
    if-ltz p2, :cond_19

    .line 5
    .line 6
    if-gez p3, :cond_0

    .line 7
    .line 8
    goto/16 :goto_9

    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {p1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, -0x1

    .line 19
    if-eq v1, v3, :cond_19

    .line 20
    .line 21
    if-eq v2, v3, :cond_19

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    goto/16 :goto_9

    .line 26
    .line 27
    :cond_1
    const/4 v4, 0x1

    .line 28
    if-eqz p4, :cond_16

    .line 29
    .line 30
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    if-ltz v1, :cond_3

    .line 39
    .line 40
    if-ge p4, v1, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    if-gez p2, :cond_4

    .line 44
    .line 45
    :cond_3
    :goto_0
    move v1, v3

    .line 46
    goto :goto_3

    .line 47
    :cond_4
    :goto_1
    move p4, v0

    .line 48
    :goto_2
    if-nez p2, :cond_5

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_5
    add-int/lit8 v1, v1, -0x1

    .line 52
    .line 53
    if-gez v1, :cond_7

    .line 54
    .line 55
    if-eqz p4, :cond_6

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_6
    move v1, v0

    .line 59
    goto :goto_3

    .line 60
    :cond_7
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz p4, :cond_9

    .line 65
    .line 66
    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 67
    .line 68
    .line 69
    move-result p4

    .line 70
    if-nez p4, :cond_8

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_8
    add-int/lit8 p2, p2, -0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_9
    invoke-static {v5}, Ljava/lang/Character;->isSurrogate(C)Z

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-nez v6, :cond_a

    .line 81
    .line 82
    add-int/lit8 p2, p2, -0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_a
    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 86
    .line 87
    .line 88
    move-result p4

    .line 89
    if-eqz p4, :cond_b

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_b
    move p4, v4

    .line 93
    goto :goto_2

    .line 94
    :goto_3
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    if-ltz v2, :cond_d

    .line 103
    .line 104
    if-ge p3, v2, :cond_c

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_c
    if-gez p2, :cond_e

    .line 108
    .line 109
    :cond_d
    :goto_4
    move p3, v3

    .line 110
    goto :goto_7

    .line 111
    :cond_e
    :goto_5
    move p4, v0

    .line 112
    :goto_6
    if-nez p2, :cond_f

    .line 113
    .line 114
    move p3, v2

    .line 115
    goto :goto_7

    .line 116
    :cond_f
    if-lt v2, p3, :cond_10

    .line 117
    .line 118
    if-eqz p4, :cond_15

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_10
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-eqz p4, :cond_12

    .line 126
    .line 127
    invoke-static {v5}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 128
    .line 129
    .line 130
    move-result p4

    .line 131
    if-nez p4, :cond_11

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_11
    add-int/lit8 p2, p2, -0x1

    .line 135
    .line 136
    add-int/lit8 v2, v2, 0x1

    .line 137
    .line 138
    goto :goto_5

    .line 139
    :cond_12
    invoke-static {v5}, Ljava/lang/Character;->isSurrogate(C)Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-nez v6, :cond_13

    .line 144
    .line 145
    add-int/lit8 p2, p2, -0x1

    .line 146
    .line 147
    add-int/lit8 v2, v2, 0x1

    .line 148
    .line 149
    goto :goto_6

    .line 150
    :cond_13
    invoke-static {v5}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    if-eqz p4, :cond_14

    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_14
    add-int/lit8 v2, v2, 0x1

    .line 158
    .line 159
    move p4, v4

    .line 160
    goto :goto_6

    .line 161
    :cond_15
    :goto_7
    if-eq v1, v3, :cond_19

    .line 162
    .line 163
    if-ne p3, v3, :cond_17

    .line 164
    .line 165
    goto :goto_9

    .line 166
    :cond_16
    sub-int/2addr v1, p2

    .line 167
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    add-int/2addr v2, p3

    .line 172
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 177
    .line 178
    .line 179
    move-result p3

    .line 180
    :cond_17
    const-class p2, Lne1;

    .line 181
    .line 182
    invoke-interface {p1, v1, p3, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    check-cast p2, [Lne1;

    .line 187
    .line 188
    if-eqz p2, :cond_19

    .line 189
    .line 190
    array-length p4, p2

    .line 191
    if-lez p4, :cond_19

    .line 192
    .line 193
    array-length p4, p2

    .line 194
    move v2, v0

    .line 195
    :goto_8
    if-ge v2, p4, :cond_18

    .line 196
    .line 197
    aget-object v3, p2, v2

    .line 198
    .line 199
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    invoke-static {v3, p3}, Ljava/lang/Math;->max(II)I

    .line 212
    .line 213
    .line 214
    move-result p3

    .line 215
    add-int/lit8 v2, v2, 0x1

    .line 216
    .line 217
    goto :goto_8

    .line 218
    :cond_18
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 219
    .line 220
    .line 221
    move-result p2

    .line 222
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 223
    .line 224
    .line 225
    move-result p4

    .line 226
    invoke-static {p3, p4}, Ljava/lang/Math;->min(II)I

    .line 227
    .line 228
    .line 229
    move-result p3

    .line 230
    invoke-virtual {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->beginBatchEdit()Z

    .line 231
    .line 232
    .line 233
    invoke-interface {p1, p2, p3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->endBatchEdit()Z

    .line 237
    .line 238
    .line 239
    return v4

    .line 240
    :cond_19
    :goto_9
    return v0
.end method

.method public static F(Landroid/content/Context;Landroid/util/AttributeSet;[II)Lc9;
    .locals 2

    .line 1
    new-instance v0, Lc9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, p2, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {v0, p0, p1}, Lc9;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static final h()V
    .locals 8

    .line 1
    new-instance v0, Lat;

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v7, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    sget-object v2, Lc9;->r:Lbt;

    .line 7
    .line 8
    const-class v3, Lbt;

    .line 9
    .line 10
    const-string v4, "isBackgroundThread"

    .line 11
    .line 12
    const-string v5, "isBackgroundThread()Z"

    .line 13
    .line 14
    invoke-direct/range {v0 .. v7}, Lat;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lat;->a()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static final i()V
    .locals 8

    .line 1
    new-instance v0, Lat;

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v7, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    sget-object v2, Lc9;->r:Lbt;

    .line 7
    .line 8
    const-class v3, Lbt;

    .line 9
    .line 10
    const-string v4, "isBlockingThread"

    .line 11
    .line 12
    const-string v5, "isBlockingThread()Z"

    .line 13
    .line 14
    invoke-direct/range {v0 .. v7}, Lat;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lat;->a()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/util/Map$Entry;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, "="

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, ""

    .line 39
    .line 40
    const-string v5, "UTF-8"

    .line 41
    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move-object v1, v4

    .line 56
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const-string v3, "&"

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ljava/util/Map$Entry;

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    if-eqz v3, :cond_1

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v1, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    goto :goto_2

    .line 105
    :cond_1
    move-object v1, v4

    .line 106
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_3
    const-string v0, "?"

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_4

    .line 134
    .line 135
    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_5
    invoke-static {p0, v0, p1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0
.end method

.method public static l(Landroid/text/Editable;Landroid/view/KeyEvent;Z)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p1}, Landroid/view/KeyEvent;->metaStateHasNoModifiers(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, -0x1

    .line 22
    if-eq p1, v2, :cond_6

    .line 23
    .line 24
    if-eq v1, v2, :cond_6

    .line 25
    .line 26
    if-eq p1, v1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const-class v2, Lne1;

    .line 30
    .line 31
    invoke-interface {p0, p1, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, [Lne1;

    .line 36
    .line 37
    if-eqz v1, :cond_6

    .line 38
    .line 39
    array-length v2, v1

    .line 40
    if-lez v2, :cond_6

    .line 41
    .line 42
    array-length v2, v1

    .line 43
    move v3, v0

    .line 44
    :goto_0
    if-ge v3, v2, :cond_6

    .line 45
    .line 46
    aget-object v4, v1, v3

    .line 47
    .line 48
    invoke-interface {p0, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-interface {p0, v4}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    if-eq v5, p1, :cond_4

    .line 59
    .line 60
    :cond_2
    if-nez p2, :cond_3

    .line 61
    .line 62
    if-eq v4, p1, :cond_4

    .line 63
    .line 64
    :cond_3
    if-le p1, v5, :cond_5

    .line 65
    .line 66
    if-ge p1, v4, :cond_5

    .line 67
    .line 68
    :cond_4
    invoke-interface {p0, v5, v4}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_6
    :goto_1
    return v0
.end method

.method public static w(Landroid/content/Context;)Lc9;
    .locals 2

    .line 1
    sget-object v0, Lc9;->n:Lc9;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lc9;->o:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lc9;->n:Lc9;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lc9;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lc9;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lc9;->n:Lc9;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lc9;->n:Lc9;

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public B(Ljava/lang/CharSequence;IILme1;)Z
    .locals 6

    .line 1
    iget v0, p4, Lme1;->c:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lhv;

    .line 13
    .line 14
    invoke-virtual {p4}, Lme1;->b()Lzn0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v4, 0x8

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Lib1;->a(I)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    iget-object v5, v0, Lib1;->d:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v5, Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    iget v0, v0, Lib1;->a:I

    .line 31
    .line 32
    add-int/2addr v4, v0

    .line 33
    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    sget-object v0, Lhv;->b:Ljava/lang/ThreadLocal;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 62
    .line 63
    .line 64
    :goto_0
    if-ge p2, p3, :cond_2

    .line 65
    .line 66
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    add-int/lit8 p2, p2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object p0, p0, Lhv;->a:Landroid/text/TextPaint;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    sget p2, Los0;->a:I

    .line 83
    .line 84
    invoke-static {p0, p1}, Lns0;->a(Landroid/graphics/Paint;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    iget p1, p4, Lme1;->c:I

    .line 89
    .line 90
    and-int/lit8 p1, p1, 0x4

    .line 91
    .line 92
    if-eqz p0, :cond_3

    .line 93
    .line 94
    or-int/lit8 p0, p1, 0x2

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    or-int/lit8 p0, p1, 0x1

    .line 98
    .line 99
    :goto_1
    iput p0, p4, Lme1;->c:I

    .line 100
    .line 101
    :cond_4
    iget p0, p4, Lme1;->c:I

    .line 102
    .line 103
    and-int/lit8 p0, p0, 0x3

    .line 104
    .line 105
    if-ne p0, v1, :cond_5

    .line 106
    .line 107
    return v3

    .line 108
    :cond_5
    return v2
.end method

.method public C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public D(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lgy0;

    .line 11
    .line 12
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 19
    .line 20
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    iget v1, p1, Lmu0;->q:I

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    if-eq v1, v2, :cond_0

    .line 26
    .line 27
    iput v1, p1, Lmu0;->p:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getImportantForAccessibility()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, p1, Lmu0;->p:I

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x4

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iput v2, p1, Lmu0;->q:I

    .line 46
    .line 47
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    sget-object p0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public E(Lgp;Lpp;Z)Z
    .locals 5

    .line 1
    iget-object p0, p0, Lc9;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lmg;

    .line 4
    .line 5
    iget-object v0, p2, Lpp;->c0:[I

    .line 6
    .line 7
    iget-object v1, p2, Lpp;->l:[I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v3, v0, v2

    .line 11
    .line 12
    iput v3, p0, Lmg;->a:I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    aget v0, v0, v3

    .line 16
    .line 17
    iput v0, p0, Lmg;->b:I

    .line 18
    .line 19
    invoke-virtual {p2}, Lpp;->j()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lmg;->c:I

    .line 24
    .line 25
    invoke-virtual {p2}, Lpp;->g()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lmg;->d:I

    .line 30
    .line 31
    iput-boolean v2, p0, Lmg;->i:Z

    .line 32
    .line 33
    iput-boolean p3, p0, Lmg;->j:Z

    .line 34
    .line 35
    iget p3, p0, Lmg;->a:I

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    if-ne p3, v0, :cond_0

    .line 39
    .line 40
    move p3, v3

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move p3, v2

    .line 43
    :goto_0
    iget v4, p0, Lmg;->b:I

    .line 44
    .line 45
    if-ne v4, v0, :cond_1

    .line 46
    .line 47
    move v0, v3

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    move v0, v2

    .line 50
    :goto_1
    const/4 v4, 0x0

    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    iget p3, p2, Lpp;->L:F

    .line 54
    .line 55
    cmpl-float p3, p3, v4

    .line 56
    .line 57
    if-lez p3, :cond_2

    .line 58
    .line 59
    move p3, v3

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    move p3, v2

    .line 62
    :goto_2
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iget v0, p2, Lpp;->L:F

    .line 65
    .line 66
    cmpl-float v0, v0, v4

    .line 67
    .line 68
    if-lez v0, :cond_3

    .line 69
    .line 70
    move v0, v3

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    move v0, v2

    .line 73
    :goto_3
    const/4 v4, 0x4

    .line 74
    if-eqz p3, :cond_4

    .line 75
    .line 76
    aget p3, v1, v2

    .line 77
    .line 78
    if-ne p3, v4, :cond_4

    .line 79
    .line 80
    iput v3, p0, Lmg;->a:I

    .line 81
    .line 82
    :cond_4
    if-eqz v0, :cond_5

    .line 83
    .line 84
    aget p3, v1, v3

    .line 85
    .line 86
    if-ne p3, v4, :cond_5

    .line 87
    .line 88
    iput v3, p0, Lmg;->b:I

    .line 89
    .line 90
    :cond_5
    invoke-virtual {p1, p2, p0}, Lgp;->a(Lpp;Lmg;)V

    .line 91
    .line 92
    .line 93
    iget p1, p0, Lmg;->e:I

    .line 94
    .line 95
    invoke-virtual {p2, p1}, Lpp;->v(I)V

    .line 96
    .line 97
    .line 98
    iget p1, p0, Lmg;->f:I

    .line 99
    .line 100
    invoke-virtual {p2, p1}, Lpp;->s(I)V

    .line 101
    .line 102
    .line 103
    iget-boolean p1, p0, Lmg;->h:Z

    .line 104
    .line 105
    iput-boolean p1, p2, Lpp;->w:Z

    .line 106
    .line 107
    iget p1, p0, Lmg;->g:I

    .line 108
    .line 109
    iput p1, p2, Lpp;->P:I

    .line 110
    .line 111
    if-lez p1, :cond_6

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_6
    move v3, v2

    .line 115
    :goto_4
    iput-boolean v3, p2, Lpp;->w:Z

    .line 116
    .line 117
    iput-boolean v2, p0, Lmg;->j:Z

    .line 118
    .line 119
    iget-boolean p0, p0, Lmg;->i:Z

    .line 120
    .line 121
    return p0
.end method

.method public G(Ljava/lang/CharSequence;IIIZLj00;)Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p6

    .line 10
    .line 11
    new-instance v5, Lk00;

    .line 12
    .line 13
    iget-object v6, v0, Lc9;->l:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v6, Ler0;

    .line 16
    .line 17
    iget-object v6, v6, Ler0;->m:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v6, Lbo0;

    .line 20
    .line 21
    invoke-direct {v5, v6}, Lk00;-><init>(Lbo0;)V

    .line 22
    .line 23
    .line 24
    invoke-static/range {p1 .. p2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    const/4 v7, 0x0

    .line 29
    const/4 v8, 0x1

    .line 30
    move v9, v6

    .line 31
    move v10, v7

    .line 32
    move v11, v8

    .line 33
    move/from16 v6, p2

    .line 34
    .line 35
    :cond_0
    :goto_0
    move v7, v6

    .line 36
    :goto_1
    const/4 v12, 0x2

    .line 37
    if-ge v6, v2, :cond_e

    .line 38
    .line 39
    if-ge v10, v3, :cond_e

    .line 40
    .line 41
    if-eqz v11, :cond_e

    .line 42
    .line 43
    iget-object v13, v5, Lk00;->f:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v13, Lbo0;

    .line 46
    .line 47
    iget-object v13, v13, Lbo0;->a:Landroid/util/SparseArray;

    .line 48
    .line 49
    invoke-virtual {v13, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v13

    .line 53
    check-cast v13, Lbo0;

    .line 54
    .line 55
    iget v14, v5, Lk00;->b:I

    .line 56
    .line 57
    const/4 v15, 0x3

    .line 58
    if-eq v14, v12, :cond_2

    .line 59
    .line 60
    if-nez v13, :cond_1

    .line 61
    .line 62
    invoke-virtual {v5}, Lk00;->a()V

    .line 63
    .line 64
    .line 65
    :goto_2
    move v13, v8

    .line 66
    goto :goto_5

    .line 67
    :cond_1
    iput v12, v5, Lk00;->b:I

    .line 68
    .line 69
    iput-object v13, v5, Lk00;->f:Ljava/lang/Object;

    .line 70
    .line 71
    iput v8, v5, Lk00;->d:I

    .line 72
    .line 73
    :goto_3
    move v13, v12

    .line 74
    goto :goto_5

    .line 75
    :cond_2
    if-eqz v13, :cond_3

    .line 76
    .line 77
    iput-object v13, v5, Lk00;->f:Ljava/lang/Object;

    .line 78
    .line 79
    iget v13, v5, Lk00;->d:I

    .line 80
    .line 81
    add-int/2addr v13, v8

    .line 82
    iput v13, v5, Lk00;->d:I

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_3
    const v13, 0xfe0e

    .line 86
    .line 87
    .line 88
    if-ne v9, v13, :cond_4

    .line 89
    .line 90
    invoke-virtual {v5}, Lk00;->a()V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    const v13, 0xfe0f

    .line 95
    .line 96
    .line 97
    if-ne v9, v13, :cond_5

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_5
    iget-object v13, v5, Lk00;->f:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v13, Lbo0;

    .line 103
    .line 104
    iget-object v14, v13, Lbo0;->b:Lme1;

    .line 105
    .line 106
    if-eqz v14, :cond_8

    .line 107
    .line 108
    iget v14, v5, Lk00;->d:I

    .line 109
    .line 110
    if-ne v14, v8, :cond_7

    .line 111
    .line 112
    invoke-virtual {v5}, Lk00;->b()Z

    .line 113
    .line 114
    .line 115
    move-result v13

    .line 116
    if-eqz v13, :cond_6

    .line 117
    .line 118
    iget-object v13, v5, Lk00;->f:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v13, Lbo0;

    .line 121
    .line 122
    iput-object v13, v5, Lk00;->g:Ljava/lang/Object;

    .line 123
    .line 124
    invoke-virtual {v5}, Lk00;->a()V

    .line 125
    .line 126
    .line 127
    :goto_4
    move v13, v15

    .line 128
    goto :goto_5

    .line 129
    :cond_6
    invoke-virtual {v5}, Lk00;->a()V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    iput-object v13, v5, Lk00;->g:Ljava/lang/Object;

    .line 134
    .line 135
    invoke-virtual {v5}, Lk00;->a()V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_8
    invoke-virtual {v5}, Lk00;->a()V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :goto_5
    iput v9, v5, Lk00;->c:I

    .line 144
    .line 145
    if-eq v13, v8, :cond_d

    .line 146
    .line 147
    if-eq v13, v12, :cond_b

    .line 148
    .line 149
    if-eq v13, v15, :cond_9

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_9
    if-nez p5, :cond_a

    .line 153
    .line 154
    iget-object v12, v5, Lk00;->g:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v12, Lbo0;

    .line 157
    .line 158
    iget-object v12, v12, Lbo0;->b:Lme1;

    .line 159
    .line 160
    invoke-virtual {v0, v1, v7, v6, v12}, Lc9;->B(Ljava/lang/CharSequence;IILme1;)Z

    .line 161
    .line 162
    .line 163
    move-result v12

    .line 164
    if-nez v12, :cond_0

    .line 165
    .line 166
    :cond_a
    iget-object v11, v5, Lk00;->g:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast v11, Lbo0;

    .line 169
    .line 170
    iget-object v11, v11, Lbo0;->b:Lme1;

    .line 171
    .line 172
    invoke-interface {v4, v1, v7, v6, v11}, Lj00;->b(Ljava/lang/CharSequence;IILme1;)Z

    .line 173
    .line 174
    .line 175
    move-result v11

    .line 176
    add-int/lit8 v10, v10, 0x1

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    invoke-static {v9}, Ljava/lang/Character;->charCount(I)I

    .line 181
    .line 182
    .line 183
    move-result v12

    .line 184
    add-int/2addr v12, v6

    .line 185
    if-ge v12, v2, :cond_c

    .line 186
    .line 187
    invoke-static {v1, v12}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    move v9, v6

    .line 192
    :cond_c
    move v6, v12

    .line 193
    goto/16 :goto_1

    .line 194
    .line 195
    :cond_d
    invoke-static {v1, v7}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    add-int/2addr v6, v7

    .line 204
    if-ge v6, v2, :cond_0

    .line 205
    .line 206
    invoke-static {v1, v6}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 207
    .line 208
    .line 209
    move-result v7

    .line 210
    move v9, v7

    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :cond_e
    iget v2, v5, Lk00;->b:I

    .line 214
    .line 215
    if-ne v2, v12, :cond_11

    .line 216
    .line 217
    iget-object v2, v5, Lk00;->f:Ljava/lang/Object;

    .line 218
    .line 219
    check-cast v2, Lbo0;

    .line 220
    .line 221
    iget-object v2, v2, Lbo0;->b:Lme1;

    .line 222
    .line 223
    if-eqz v2, :cond_11

    .line 224
    .line 225
    iget v2, v5, Lk00;->d:I

    .line 226
    .line 227
    if-gt v2, v8, :cond_f

    .line 228
    .line 229
    invoke-virtual {v5}, Lk00;->b()Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-eqz v2, :cond_11

    .line 234
    .line 235
    :cond_f
    if-ge v10, v3, :cond_11

    .line 236
    .line 237
    if-eqz v11, :cond_11

    .line 238
    .line 239
    if-nez p5, :cond_10

    .line 240
    .line 241
    iget-object v2, v5, Lk00;->f:Ljava/lang/Object;

    .line 242
    .line 243
    check-cast v2, Lbo0;

    .line 244
    .line 245
    iget-object v2, v2, Lbo0;->b:Lme1;

    .line 246
    .line 247
    invoke-virtual {v0, v1, v7, v6, v2}, Lc9;->B(Ljava/lang/CharSequence;IILme1;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-nez v0, :cond_11

    .line 252
    .line 253
    :cond_10
    iget-object v0, v5, Lk00;->f:Ljava/lang/Object;

    .line 254
    .line 255
    check-cast v0, Lbo0;

    .line 256
    .line 257
    iget-object v0, v0, Lbo0;->b:Lme1;

    .line 258
    .line 259
    invoke-interface {v4, v1, v7, v6, v0}, Lj00;->b(Ljava/lang/CharSequence;IILme1;)Z

    .line 260
    .line 261
    .line 262
    :cond_11
    invoke-interface {v4}, Lj00;->a()Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    return-object v0
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I(Lqf;IZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lc9;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Lhf;

    .line 10
    .line 11
    new-instance v4, Landroid/content/ComponentName;

    .line 12
    .line 13
    iget-object v5, v0, Lc9;->m:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v5, Landroid/content/Context;

    .line 16
    .line 17
    const-class v6, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    .line 18
    .line 19
    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    const-string v6, "jobscheduler"

    .line 23
    .line 24
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    check-cast v6, Landroid/app/job/JobScheduler;

    .line 29
    .line 30
    new-instance v7, Ljava/util/zip/Adler32;

    .line 31
    .line 32
    invoke-direct {v7}, Ljava/util/zip/Adler32;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    const-string v8, "UTF-8"

    .line 40
    .line 41
    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    invoke-virtual {v5, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v7, v5}, Ljava/util/zip/Adler32;->update([B)V

    .line 50
    .line 51
    .line 52
    iget-object v5, v1, Lqf;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    invoke-virtual {v5, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    invoke-virtual {v7, v8}, Ljava/util/zip/Adler32;->update([B)V

    .line 63
    .line 64
    .line 65
    const/4 v8, 0x4

    .line 66
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    iget-object v9, v1, Lqf;->c:Lav0;

    .line 71
    .line 72
    invoke-static {v9}, Ldv0;->a(Lav0;)I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    invoke-virtual {v8, v10}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    invoke-virtual {v7, v8}, Ljava/util/zip/Adler32;->update([B)V

    .line 85
    .line 86
    .line 87
    iget-object v8, v1, Lqf;->b:[B

    .line 88
    .line 89
    if-eqz v8, :cond_0

    .line 90
    .line 91
    invoke-virtual {v7, v8}, Ljava/util/zip/Adler32;->update([B)V

    .line 92
    .line 93
    .line 94
    :cond_0
    invoke-virtual {v7}, Ljava/util/zip/Adler32;->getValue()J

    .line 95
    .line 96
    .line 97
    move-result-wide v10

    .line 98
    long-to-int v7, v10

    .line 99
    const-string v10, "JobInfoScheduler"

    .line 100
    .line 101
    const-string v11, "attemptNumber"

    .line 102
    .line 103
    if-nez p3, :cond_2

    .line 104
    .line 105
    invoke-virtual {v6}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v12

    .line 109
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v12

    .line 113
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v13

    .line 117
    if-eqz v13, :cond_2

    .line 118
    .line 119
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v13

    .line 123
    check-cast v13, Landroid/app/job/JobInfo;

    .line 124
    .line 125
    invoke-virtual {v13}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 126
    .line 127
    .line 128
    move-result-object v14

    .line 129
    invoke-virtual {v14, v11}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v14

    .line 133
    invoke-virtual {v13}, Landroid/app/job/JobInfo;->getId()I

    .line 134
    .line 135
    .line 136
    move-result v13

    .line 137
    if-ne v13, v7, :cond_1

    .line 138
    .line 139
    if-lt v14, v2, :cond_2

    .line 140
    .line 141
    const-string v0, "Upload for context %s is already scheduled. Returning..."

    .line 142
    .line 143
    invoke-static {v10, v0, v1}, Lbe2;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    iget-object v0, v0, Lc9;->k:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v0, Lh21;

    .line 150
    .line 151
    invoke-virtual {v0}, Lh21;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-static {v9}, Ldv0;->a(Lav0;)I

    .line 156
    .line 157
    .line 158
    move-result v12

    .line 159
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    filled-new-array {v5, v12}, [Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v12

    .line 167
    const-string v13, "SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?"

    .line 168
    .line 169
    invoke-virtual {v0, v13, v12}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 170
    .line 171
    .line 172
    move-result-object v12

    .line 173
    :try_start_0
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    const/4 v13, 0x0

    .line 178
    if-eqz v0, :cond_3

    .line 179
    .line 180
    invoke-interface {v12, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 181
    .line 182
    .line 183
    move-result-wide v14

    .line 184
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    goto :goto_0

    .line 189
    :cond_3
    const-wide/16 v14, 0x0

    .line 190
    .line 191
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 192
    .line 193
    .line 194
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    :goto_0
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 199
    .line 200
    .line 201
    move-result-wide v14

    .line 202
    new-instance v12, Landroid/app/job/JobInfo$Builder;

    .line 203
    .line 204
    invoke-direct {v12, v7, v4}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 205
    .line 206
    .line 207
    move-object v4, v6

    .line 208
    move/from16 v16, v7

    .line 209
    .line 210
    invoke-virtual {v3, v9, v14, v15, v2}, Lhf;->a(Lav0;JI)J

    .line 211
    .line 212
    .line 213
    move-result-wide v6

    .line 214
    invoke-virtual {v12, v6, v7}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    .line 215
    .line 216
    .line 217
    iget-object v6, v3, Lhf;->b:Ljava/util/HashMap;

    .line 218
    .line 219
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    check-cast v6, Ljf;

    .line 224
    .line 225
    iget-object v6, v6, Ljf;->c:Ljava/util/Set;

    .line 226
    .line 227
    sget-object v7, La31;->j:La31;

    .line 228
    .line 229
    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v7

    .line 233
    const/4 v13, 0x1

    .line 234
    if-eqz v7, :cond_4

    .line 235
    .line 236
    const/4 v7, 0x2

    .line 237
    invoke-virtual {v12, v7}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 238
    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_4
    invoke-virtual {v12, v13}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 242
    .line 243
    .line 244
    :goto_1
    sget-object v7, La31;->l:La31;

    .line 245
    .line 246
    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v7

    .line 250
    if-eqz v7, :cond_5

    .line 251
    .line 252
    invoke-virtual {v12, v13}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    .line 253
    .line 254
    .line 255
    :cond_5
    sget-object v7, La31;->k:La31;

    .line 256
    .line 257
    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v6

    .line 261
    if-eqz v6, :cond_6

    .line 262
    .line 263
    invoke-virtual {v12, v13}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    .line 264
    .line 265
    .line 266
    :cond_6
    new-instance v6, Landroid/os/PersistableBundle;

    .line 267
    .line 268
    invoke-direct {v6}, Landroid/os/PersistableBundle;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v6, v11, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 272
    .line 273
    .line 274
    const-string v7, "backendName"

    .line 275
    .line 276
    invoke-virtual {v6, v7, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    const-string v5, "priority"

    .line 280
    .line 281
    invoke-static {v9}, Ldv0;->a(Lav0;)I

    .line 282
    .line 283
    .line 284
    move-result v7

    .line 285
    invoke-virtual {v6, v5, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 286
    .line 287
    .line 288
    if-eqz v8, :cond_7

    .line 289
    .line 290
    const-string v5, "extras"

    .line 291
    .line 292
    const/4 v7, 0x0

    .line 293
    invoke-static {v8, v7}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v7

    .line 297
    invoke-virtual {v6, v5, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    :cond_7
    invoke-virtual {v12, v6}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    .line 301
    .line 302
    .line 303
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 304
    .line 305
    .line 306
    move-result-object v5

    .line 307
    invoke-virtual {v3, v9, v14, v15, v2}, Lhf;->a(Lav0;JI)J

    .line 308
    .line 309
    .line 310
    move-result-wide v6

    .line 311
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    filled-new-array {v1, v5, v3, v0, v2}, [Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-static {v10}, Lbe2;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    const/4 v2, 0x3

    .line 328
    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    if-eqz v1, :cond_8

    .line 333
    .line 334
    const-string v1, "Scheduling upload for context %s with jobId=%d in %dms(Backend next call timestamp %d). Attempt %d"

    .line 335
    .line 336
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    :cond_8
    invoke-virtual {v12}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v4, v0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :catchall_0
    move-exception v0

    .line 348
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 349
    .line 350
    .line 351
    throw v0
.end method

.method public J(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lc9;->k:Ljava/lang/Object;

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Null backendName"

    .line 7
    .line 8
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public K(Lqp;II)V
    .locals 3

    .line 1
    iget v0, p1, Lpp;->Q:I

    .line 2
    .line 3
    iget v1, p1, Lpp;->R:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, p1, Lpp;->Q:I

    .line 7
    .line 8
    iput v2, p1, Lpp;->R:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lpp;->v(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p3}, Lpp;->s(I)V

    .line 14
    .line 15
    .line 16
    if-gez v0, :cond_0

    .line 17
    .line 18
    iput v2, p1, Lpp;->Q:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iput v0, p1, Lpp;->Q:I

    .line 22
    .line 23
    :goto_0
    if-gez v1, :cond_1

    .line 24
    .line 25
    iput v2, p1, Lpp;->R:I

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iput v1, p1, Lpp;->R:I

    .line 29
    .line 30
    :goto_1
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Lqp;

    .line 33
    .line 34
    invoke-virtual {p0}, Lqp;->B()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public L(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lc9;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lgy0;

    .line 14
    .line 15
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    iget v0, p1, Lmu0;->p:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iput v0, p1, Lmu0;->q:I

    .line 32
    .line 33
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p0, p1, Lmu0;->a:Landroid/view/View;

    .line 40
    .line 41
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    const/4 p0, 0x0

    .line 47
    iput p0, p1, Lmu0;->p:I

    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public declared-synchronized M(IIJJ)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, v1, Lc9;->k:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ly02;

    .line 7
    .line 8
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    iget-object v0, v1, Lc9;->m:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    const-wide/16 v6, -0x1

    .line 26
    .line 27
    cmp-long v4, v4, v6

    .line 28
    .line 29
    if-nez v4, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    sub-long v4, v2, v4

    .line 37
    .line 38
    const-wide/32 v6, 0x1b7740

    .line 39
    .line 40
    .line 41
    cmp-long v0, v4, v6

    .line 42
    .line 43
    if-gtz v0, :cond_1

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :cond_1
    :goto_0
    :try_start_1
    iget-object v0, v1, Lc9;->l:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Lpm1;

    .line 50
    .line 51
    new-instance v4, Lsb1;

    .line 52
    .line 53
    new-instance v5, Lco0;

    .line 54
    .line 55
    const/4 v14, 0x0

    .line 56
    const/4 v15, 0x0

    .line 57
    const v6, 0x8dcd

    .line 58
    .line 59
    .line 60
    const/4 v8, 0x0

    .line 61
    const/4 v13, 0x0

    .line 62
    move/from16 v7, p1

    .line 63
    .line 64
    move/from16 v16, p2

    .line 65
    .line 66
    move-wide/from16 v9, p3

    .line 67
    .line 68
    move-wide/from16 v11, p5

    .line 69
    .line 70
    invoke-direct/range {v5 .. v16}, Lco0;-><init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    filled-new-array {v5}, [Lco0;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const/4 v6, 0x0

    .line 82
    invoke-direct {v4, v6, v5}, Lsb1;-><init>(ILjava/util/List;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v4}, Lpm1;->c(Lsb1;)Ljd2;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v4, Ldk;

    .line 90
    .line 91
    invoke-direct {v4, v1, v2, v3}, Ldk;-><init>(Lc9;J)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    sget-object v2, Lmb1;->a:Lq10;

    .line 98
    .line 99
    invoke-virtual {v0, v2, v4}, Ljd2;->c(Ljava/util/concurrent/Executor;Lyr0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .line 101
    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :catchall_0
    move-exception v0

    .line 105
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    throw v0
.end method

.method public a()Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p2, Llb1;

    .line 2
    .line 3
    check-cast p1, Lf42;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljg;->s()Landroid/os/IInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ld42;

    .line 10
    .line 11
    new-instance p2, Lg32;

    .line 12
    .line 13
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lu32;

    .line 16
    .line 17
    iget-object v1, p0, Lc9;->m:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lm4;

    .line 20
    .line 21
    invoke-direct {p2, v0, v1}, Lg32;-><init>(Lu32;Lm4;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lc9;->l:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Lfl1;->F()Landroid/os/Parcel;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p2}, Lwu1;->c(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 36
    .line 37
    .line 38
    const/16 p0, 0x1c

    .line 39
    .line 40
    invoke-virtual {p1, v0, p0}, Lfl1;->G(Landroid/os/Parcel;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public b()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/net/Uri;

    .line 4
    .line 5
    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Lc9;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance v0, Lc9;

    .line 12
    .line 13
    iget-object v1, p0, Lc9;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Lcn1;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcn1;->a()Lcn1;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Lc9;-><init>(Lcn1;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, 0x0

    .line 33
    :goto_0
    if-ge v2, v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    check-cast v3, Lcn1;

    .line 42
    .line 43
    iget-object v4, v0, Lc9;->m:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v4, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v3}, Lcn1;->a()Lcn1;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-object v0

    .line 56
    nop

    .line 57
    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_0
    .end packed-switch
.end method

.method public d()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/net/Uri;

    .line 4
    .line 5
    return-object p0
.end method

.method public e(Landroid/view/View;IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lgy0;

    .line 4
    .line 5
    iget-object v0, v0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    if-gez p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0, p2}, Lc9;->x(I)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    :goto_0
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ldk;

    .line 21
    .line 22
    invoke-virtual {v1, p2, p3}, Ldk;->e(IZ)V

    .line 23
    .line 24
    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lc9;->D(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public f(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lgy0;

    .line 4
    .line 5
    iget-object v0, v0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    if-gez p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0, p2}, Lc9;->x(I)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    :goto_0
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ldk;

    .line 21
    .line 22
    invoke-virtual {v1, p2, p4}, Ldk;->e(IZ)V

    .line 23
    .line 24
    .line 25
    if-eqz p4, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lc9;->D(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    invoke-virtual {p0}, Lmu0;->k()Z

    .line 37
    .line 38
    .line 39
    move-result p4

    .line 40
    if-nez p4, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Lmu0;->p()Z

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-eqz p4, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 50
    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string p3, "Called attach on a child which is not detached: "

    .line 54
    .line 55
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :cond_3
    :goto_1
    iget p4, p0, Lmu0;->j:I

    .line 77
    .line 78
    and-int/lit16 p4, p4, -0x101

    .line 79
    .line 80
    iput p4, p0, Lmu0;->j:I

    .line 81
    .line 82
    :cond_4
    invoke-static {v0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public g()Lqf;
    .locals 3

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, " backendName"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    :goto_0
    iget-object v1, p0, Lc9;->m:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Lav0;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    const-string v1, " priority"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    new-instance v0, Lqf;

    .line 31
    .line 32
    iget-object v1, p0, Lc9;->k:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Lc9;->l:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v2, [B

    .line 39
    .line 40
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p0, Lav0;

    .line 43
    .line 44
    invoke-direct {v0, v1, v2, p0}, Lqf;-><init>(Ljava/lang/String;[BLav0;)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    const-string p0, "Missing required properties:"

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public get()Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Lc9;->j:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v2, Ltb0;

    .line 7
    .line 8
    const/16 v0, 0x17

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ltb0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v3, Lt11;

    .line 14
    .line 15
    const/16 v0, 0x16

    .line 16
    .line 17
    invoke-direct {v3, v0}, Lt11;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Law;

    .line 23
    .line 24
    invoke-virtual {v0}, Law;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    move-object v4, v0

    .line 29
    check-cast v4, Lzv;

    .line 30
    .line 31
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Lgd1;

    .line 34
    .line 35
    invoke-virtual {v0}, Lgd1;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    move-object v5, v0

    .line 40
    check-cast v5, Lve;

    .line 41
    .line 42
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Ler0;

    .line 45
    .line 46
    invoke-virtual {p0}, Ler0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    move-object v6, p0

    .line 51
    check-cast v6, Ler0;

    .line 52
    .line 53
    new-instance v1, Lxd1;

    .line 54
    .line 55
    invoke-direct/range {v1 .. v6}, Lxd1;-><init>(Lok;Lok;Lzv;Lve;Ler0;)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :sswitch_0
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v0, Ljw0;

    .line 62
    .line 63
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lsq;

    .line 68
    .line 69
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v1, Ljw0;

    .line 72
    .line 73
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lkc1;

    .line 78
    .line 79
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p0, Ljw0;

    .line 82
    .line 83
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Lyt;

    .line 88
    .line 89
    new-instance v2, Lm61;

    .line 90
    .line 91
    invoke-direct {v2, v0, v1, p0}, Lm61;-><init>(Lsq;Lkc1;Lyt;)V

    .line 92
    .line 93
    .line 94
    return-object v2

    .line 95
    :sswitch_1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v0, Lkw0;

    .line 98
    .line 99
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroid/content/Context;

    .line 104
    .line 105
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v1, Lkw0;

    .line 108
    .line 109
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lh21;

    .line 114
    .line 115
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast p0, Lmz;

    .line 118
    .line 119
    invoke-virtual {p0}, Lmz;->get()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, Lhf;

    .line 124
    .line 125
    new-instance v2, Lc9;

    .line 126
    .line 127
    const/16 v3, 0xe

    .line 128
    .line 129
    invoke-direct {v2, v0, v1, p0, v3}, Lc9;-><init>(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 130
    .line 131
    .line 132
    return-object v2

    .line 133
    :sswitch_2
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v0, Lbv1;

    .line 136
    .line 137
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v0, Landroid/content/Context;

    .line 140
    .line 141
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v1, Ljw0;

    .line 144
    .line 145
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Lsq;

    .line 150
    .line 151
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast p0, Ljw0;

    .line 154
    .line 155
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Lv41;

    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    .line 169
    .line 170
    new-instance v2, Lpa0;

    .line 171
    .line 172
    new-instance v3, Lm;

    .line 173
    .line 174
    const/4 v4, 0x1

    .line 175
    invoke-direct {v3, v4, p0}, Lm;-><init>(ILjava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    const/16 v5, 0x15

    .line 179
    .line 180
    invoke-direct {v2, v5, v3}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v1}, Lfe1;->b(Lsq;)Lgq;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    new-instance v3, Lg50;

    .line 188
    .line 189
    invoke-direct {v3, v0, v4}, Lg50;-><init>(Landroid/content/Context;I)V

    .line 190
    .line 191
    .line 192
    invoke-static {p0, v2, v1, v3}, Lt11;->j(Lm41;Lpa0;Lgq;Lp80;)Lwu;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :sswitch_data_0
    .sparse-switch
        0xb -> :sswitch_2
        0x14 -> :sswitch_1
        0x15 -> :sswitch_0
    .end sparse-switch
.end method

.method public getDescription()Landroid/content/ClipDescription;
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/content/ClipDescription;

    .line 4
    .line 5
    return-object p0
.end method

.method public k(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Lc9;->m:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object v1, p0, Lc9;->k:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lbv1;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lbv1;->k(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    :try_start_1
    iget-object p1, p0, Lc9;->m:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ljava/util/concurrent/CountDownLatch;

    .line 25
    .line 26
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 27
    .line 28
    const-wide/16 v2, 0x1f4

    .line 29
    .line 30
    invoke-virtual {p1, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :catch_0
    :goto_0
    const/4 p1, 0x0

    .line 37
    :try_start_2
    iput-object p1, p0, Lc9;->m:Ljava/lang/Object;

    .line 38
    .line 39
    monitor-exit v0

    .line 40
    return-void

    .line 41
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    throw p0
.end method

.method public m(I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lc9;->x(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ldk;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ldk;->f(I)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lgy0;

    .line 15
    .line 16
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Lmu0;->k()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Lmu0;->p()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "called detach on an already detached child "

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p1

    .line 70
    :cond_1
    :goto_0
    const/16 v1, 0x100

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lmu0;->a(I)V

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-static {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public n(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashSet;

    .line 4
    .line 5
    iget-object v1, p0, Lc9;->m:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Landroid/content/Context;

    .line 8
    .line 9
    const v2, 0x7f110021

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Ljava/lang/String;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual {p1, v4, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_0

    .line 53
    .line 54
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const-class v5, Lhe0;

    .line 59
    .line 60
    invoke-virtual {v5, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_0

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Ljava/lang/Class;

    .line 85
    .line 86
    invoke-virtual {p0, v0, v2}, Lc9;->o(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :catch_0
    move-exception p0

    .line 91
    new-instance p1, Lrl;

    .line 92
    .line 93
    invoke-direct {p1, p0}, Lrl;-><init>(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    throw p1

    .line 97
    :cond_2
    return-void
.end method

.method public o(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    const-string v1, "Cannot initialize "

    .line 6
    .line 7
    invoke-static {}, Ldl1;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_4

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    :try_start_1
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lhe0;

    .line 45
    .line 46
    invoke-interface {v1}, Lhe0;->a()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Ljava/lang/Class;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-nez v4, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0, v3, p2}, Lc9;->o(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p0, Landroid/content/Context;

    .line 85
    .line 86
    invoke-interface {v1, p0}, Lhe0;->b(Landroid/content/Context;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catchall_0
    move-exception p0

    .line 98
    :try_start_2
    new-instance p1, Lrl;

    .line 99
    .line 100
    invoke-direct {p1, p0}, Lrl;-><init>(Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    throw p1

    .line 104
    :cond_3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 108
    :goto_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 109
    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_4
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance p1, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p0, ". Cycle detected."

    .line 125
    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 134
    .line 135
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 139
    :catchall_1
    move-exception p0

    .line 140
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 141
    .line 142
    .line 143
    throw p0
.end method

.method public onEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p2, "_ae"

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public p()Lf4;
    .locals 7

    .line 1
    invoke-static {}, Lc9;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Lc9;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-static {v1, v2}, Lc9;->j(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ljava/net/URL;

    .line 18
    .line 19
    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 27
    .line 28
    const/16 v2, 0x2710

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 34
    .line 35
    .line 36
    const-string v2, "GET"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Ljava/util/Map$Entry;

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1, v3, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_3

    .line 83
    :cond_0
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 91
    .line 92
    .line 93
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    if-eqz v2, :cond_2

    .line 95
    .line 96
    :try_start_2
    new-instance v0, Ljava/io/BufferedReader;

    .line 97
    .line 98
    new-instance v3, Ljava/io/InputStreamReader;

    .line 99
    .line 100
    const-string v4, "UTF-8"

    .line 101
    .line 102
    invoke-direct {v3, v2, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 106
    .line 107
    .line 108
    const/16 v3, 0x2000

    .line 109
    .line 110
    new-array v3, v3, [C

    .line 111
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    :goto_1
    invoke-virtual {v0, v3}, Ljava/io/Reader;->read([C)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    const/4 v6, -0x1

    .line 122
    if-eq v5, v6, :cond_1

    .line 123
    .line 124
    const/4 v6, 0x0

    .line 125
    invoke-virtual {v4, v3, v6, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 133
    goto :goto_2

    .line 134
    :catchall_1
    move-exception p0

    .line 135
    move-object v0, v2

    .line 136
    goto :goto_3

    .line 137
    :cond_2
    :goto_2
    if-eqz v2, :cond_3

    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 140
    .line 141
    .line 142
    :cond_3
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 143
    .line 144
    .line 145
    new-instance v1, Lf4;

    .line 146
    .line 147
    const/4 v2, 0x2

    .line 148
    invoke-direct {v1, p0, v0, v2}, Lf4;-><init>(ILjava/io/Serializable;I)V

    .line 149
    .line 150
    .line 151
    return-object v1

    .line 152
    :catchall_2
    move-exception p0

    .line 153
    move-object v1, v0

    .line 154
    :goto_3
    if-eqz v0, :cond_4

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 157
    .line 158
    .line 159
    :cond_4
    if-eqz v1, :cond_5

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 162
    .line 163
    .line 164
    :cond_5
    throw p0
.end method

.method public q(I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lc9;->x(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lgy0;

    .line 8
    .line 9
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public r()I
    .locals 1

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lgy0;

    .line 4
    .line 5
    iget-object v0, v0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public s(I)Landroid/content/res/ColorStateList;
    .locals 2

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {p0, v1}, Lbh;->p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public t(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {p0, v1}, Lrs0;->g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lc9;->j:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :sswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const/16 v1, 0x20

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lc9;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const/16 v1, 0x7b

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lc9;->l:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Lxn0;

    .line 33
    .line 34
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p0, Lxn0;

    .line 37
    .line 38
    const-string v1, ""

    .line 39
    .line 40
    :goto_0
    if-eqz p0, :cond_1

    .line 41
    .line 42
    iget-object v2, p0, Lxn0;->k:Ljava/lang/Object;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v3, 0x1

    .line 72
    sub-int/2addr v2, v3

    .line 73
    invoke-virtual {v0, v1, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast p0, Lxn0;

    .line 83
    .line 84
    const-string v1, ", "

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/16 p0, 0x7d

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :sswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v1, "JsonConfiguration(encodeDefaults=false, ignoreUnknownKeys=false, isLenient=false, allowStructuredMapKeys=false, prettyPrint=false, explicitNulls=true, prettyPrintIndent=\'"

    .line 100
    .line 101
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lc9;->k:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v1, Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, "\', coerceInputValues=false, useArrayPolymorphism=false, classDiscriminator=\'"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v1, Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', allowSpecialFloatingPointValues=false, useAlternativeNames=true, namingStrategy=null, decodeEnumsCaseInsensitive=false, allowTrailingComma=false, allowComments=false, classDiscriminatorMode="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast p0, Lgk;

    .line 131
    .line 132
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const/16 p0, 0x29

    .line 136
    .line 137
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :sswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v1, Ldk;

    .line 153
    .line 154
    invoke-virtual {v1}, Ldk;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v1, ", hidden list:"

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast p0, Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    return-object p0

    .line 182
    nop

    .line 183
    :sswitch_data_0
    .sparse-switch
        0x7 -> :sswitch_2
        0xf -> :sswitch_1
        0x13 -> :sswitch_0
    .end sparse-switch
.end method

.method public u(I)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Landroid/content/res/TypedArray;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lj7;->a()Lj7;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p0, Landroid/content/Context;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    iget-object v1, v0, Lj7;->a:Lw01;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v1, p0, p1, v2}, Lw01;->e(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    monitor-exit v0

    .line 39
    return-object p0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public v(IILk8;)Landroid/graphics/Typeface;
    .locals 10

    .line 1
    iget-object v0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 7
    .line 8
    .line 9
    move-result v5

    .line 10
    const/4 p1, 0x0

    .line 11
    if-nez v5, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Landroid/util/TypedValue;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Landroid/util/TypedValue;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 26
    .line 27
    :cond_1
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v2, p0

    .line 30
    check-cast v2, Landroid/content/Context;

    .line 31
    .line 32
    sget-object p0, Lc11;->a:Ljava/lang/ThreadLocal;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/content/Context;->isRestricted()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    :goto_0
    return-object p1

    .line 41
    :cond_2
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/4 p0, 0x1

    .line 46
    invoke-virtual {v4, v5, v0, p0}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v0, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    .line 50
    .line 51
    if-eqz p0, :cond_9

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    const-string p0, "res/"

    .line 58
    .line 59
    invoke-virtual {v6, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p3}, Lk8;->a()V

    .line 66
    .line 67
    .line 68
    goto/16 :goto_3

    .line 69
    .line 70
    :cond_3
    iget p0, v0, Landroid/util/TypedValue;->assetCookie:I

    .line 71
    .line 72
    sget-object v1, Lge1;->b:Lvk0;

    .line 73
    .line 74
    invoke-static {v4, v5, v6, p0, p2}, Lge1;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v1, p0}, Lvk0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Landroid/graphics/Typeface;

    .line 83
    .line 84
    const/16 v8, 0xf

    .line 85
    .line 86
    if-eqz p0, :cond_4

    .line 87
    .line 88
    new-instance p1, Landroid/os/Handler;

    .line 89
    .line 90
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 95
    .line 96
    .line 97
    new-instance p2, Lo6;

    .line 98
    .line 99
    invoke-direct {p2, p3, v8, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 103
    .line 104
    .line 105
    move-object p1, p0

    .line 106
    goto :goto_3

    .line 107
    :cond_4
    :try_start_0
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string v3, ".xml"

    .line 112
    .line 113
    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_6

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0, v4}, Lkn1;->i(Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources;)Ls60;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    if-nez v3, :cond_5

    .line 128
    .line 129
    invoke-virtual {p3}, Lk8;->a()V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :catch_0
    move-object v9, p3

    .line 134
    goto :goto_2

    .line 135
    :cond_5
    iget v7, v0, Landroid/util/TypedValue;->assetCookie:I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .line 137
    move v8, p2

    .line 138
    move-object v9, p3

    .line 139
    :try_start_1
    invoke-static/range {v2 .. v9}, Lge1;->a(Landroid/content/Context;Ls60;Landroid/content/res/Resources;ILjava/lang/String;IILk8;)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    goto :goto_3

    .line 144
    :cond_6
    move v7, p2

    .line 145
    move-object v9, p3

    .line 146
    iget p0, v0, Landroid/util/TypedValue;->assetCookie:I

    .line 147
    .line 148
    move-object v3, v2

    .line 149
    sget-object v2, Lge1;->a:Lrs0;

    .line 150
    .line 151
    invoke-virtual/range {v2 .. v7}, Lrs0;->e(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    if-eqz p2, :cond_7

    .line 156
    .line 157
    invoke-static {v4, v5, v6, p0, v7}, Lge1;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {v1, p0, p2}, Lvk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    :cond_7
    if-eqz p2, :cond_8

    .line 165
    .line 166
    new-instance p0, Landroid/os/Handler;

    .line 167
    .line 168
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 173
    .line 174
    .line 175
    new-instance p3, Lo6;

    .line 176
    .line 177
    invoke-direct {p3, v9, v8, p2}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 181
    .line 182
    .line 183
    :goto_1
    move-object p1, p2

    .line 184
    goto :goto_3

    .line 185
    :cond_8
    invoke-virtual {v9}, Lk8;->a()V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :catch_1
    :goto_2
    invoke-virtual {v9}, Lk8;->a()V

    .line 190
    .line 191
    .line 192
    :goto_3
    return-object p1

    .line 193
    :cond_9
    new-instance p0, Landroid/content/res/Resources$NotFoundException;

    .line 194
    .line 195
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    new-instance p3, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v1, "Resource \""

    .line 206
    .line 207
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string p1, "\" ("

    .line 214
    .line 215
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string p1, ") is not a Font: "

    .line 222
    .line 223
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-direct {p0, p1}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    throw p0
.end method

.method public x(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lc9;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ldk;

    .line 4
    .line 5
    if-gez p1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lgy0;

    .line 11
    .line 12
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    move v1, p1

    .line 19
    :goto_0
    if-ge v1, p0, :cond_3

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ldk;->b(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    sub-int v2, v1, v2

    .line 26
    .line 27
    sub-int v2, p1, v2

    .line 28
    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    :goto_1
    invoke-virtual {v0, v1}, Ldk;->d(I)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    return v1

    .line 41
    :cond_2
    add-int/2addr v1, v2

    .line 42
    goto :goto_0

    .line 43
    :cond_3
    :goto_2
    const/4 p0, -0x1

    .line 44
    return p0
.end method

.method public y(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lgy0;

    .line 4
    .line 5
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public z()I
    .locals 0

    .line 1
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lgy0;

    .line 4
    .line 5
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

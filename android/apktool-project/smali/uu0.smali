.class public final Luu0;
.super Lja0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final DEFAULT_INSTANCE:Luu0;

.field private static volatile PARSER:Lts0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lts0;"
        }
    .end annotation
.end field

.field public static final STRINGS_FIELD_NUMBER:I = 0x1


# instance fields
.field private strings_:Ljf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljf0;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Luu0;

    .line 2
    .line 3
    invoke-direct {v0}, Luu0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 7
    .line 8
    const-class v1, Luu0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lja0;->j(Ljava/lang/Class;Lja0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lja0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lfw0;->m:Lfw0;

    .line 5
    .line 6
    iput-object v0, p0, Luu0;->strings_:Ljf0;

    .line 7
    .line 8
    return-void
.end method

.method public static m()Luu0;
    .locals 1

    .line 1
    sget-object v0, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static o()Ltu0;
    .locals 2

    .line 1
    sget-object v0, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-virtual {v0, v1}, Luu0;->c(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lfa0;

    .line 9
    .line 10
    check-cast v0, Ltu0;

    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public final c(I)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    packed-switch p0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lo40;->c()V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :pswitch_0
    sget-object p0, Luu0;->PARSER:Lts0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Luu0;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Luu0;->PARSER:Lts0;

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    new-instance p0, Lha0;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object p0, Luu0;->PARSER:Lts0;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit p1

    .line 35
    return-object p0

    .line 36
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0

    .line 38
    :cond_1
    return-object p0

    .line 39
    :pswitch_1
    sget-object p0, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_2
    new-instance p0, Ltu0;

    .line 43
    .line 44
    sget-object p1, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lfa0;-><init>(Lja0;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_3
    new-instance p0, Luu0;

    .line 51
    .line 52
    invoke-direct {p0}, Luu0;-><init>()V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_4
    const-string p0, "strings_"

    .line 57
    .line 58
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001a"

    .line 63
    .line 64
    sget-object v0, Luu0;->DEFAULT_INSTANCE:Luu0;

    .line 65
    .line 66
    new-instance v1, Lpx0;

    .line 67
    .line 68
    invoke-direct {v1, v0, p1, p0}, Lpx0;-><init>(Lja0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-object v1

    .line 72
    :pswitch_5
    return-object p1

    .line 73
    :pswitch_6
    const/4 p0, 0x1

    .line 74
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final l(Ljava/util/Set;)V
    .locals 3

    .line 1
    iget-object v0, p0, Luu0;->strings_:Ljf0;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lfw0;

    .line 5
    .line 6
    iget-boolean v1, v1, Lfw0;->j:Z

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Lfw0;

    .line 11
    .line 12
    iget v1, v0, Lfw0;->l:I

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const/16 v1, 0xa

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    mul-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Lfw0;->d(I)Lfw0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Luu0;->strings_:Ljf0;

    .line 26
    .line 27
    :cond_1
    sget-object p0, Llf0;->a:Ljava/nio/charset/Charset;

    .line 28
    .line 29
    instance-of p0, v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    move-object p0, v0

    .line 34
    check-cast p0, Ljava/util/ArrayList;

    .line 35
    .line 36
    move-object v1, v0

    .line 37
    check-cast v1, Lfw0;

    .line 38
    .line 39
    iget v1, v1, Lfw0;->l:I

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    add-int/2addr v2, v1

    .line 46
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    check-cast v0, Lfw0;

    .line 50
    .line 51
    iget p0, v0, Lfw0;->l:I

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_5

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v1, "Element at index "

    .line 72
    .line 73
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget v1, v0, Lfw0;->l:I

    .line 77
    .line 78
    sub-int/2addr v1, p0

    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v1, " is null."

    .line 83
    .line 84
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget v1, v0, Lfw0;->l:I

    .line 92
    .line 93
    add-int/lit8 v1, v1, -0x1

    .line 94
    .line 95
    :goto_2
    if-lt v1, p0, :cond_3

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lfw0;->remove(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    add-int/lit8 v1, v1, -0x1

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_3
    invoke-static {p1}, Lwd1;->d(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    invoke-virtual {v0, v1}, Lfw0;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_5
    return-void
.end method

.method public final n()Ljf0;
    .locals 0

    .line 1
    iget-object p0, p0, Luu0;->strings_:Ljf0;

    .line 2
    .line 3
    return-object p0
.end method

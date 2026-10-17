.class public final Lif2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final d:Lgf2;

.field public static final e:Lhf2;


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public c:Lhf2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lgf2;

    .line 2
    .line 3
    invoke-direct {v0}, Lgf2;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lif2;->d:Lgf2;

    .line 7
    .line 8
    new-instance v0, Lhf2;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Lhf2;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lif2;->e:Lhf2;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lif2;->a:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lif2;->b:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lif2;->c:Lhf2;

    return-void
.end method

.method public constructor <init>(Lif2;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lif2;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lif2;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    iget-object v2, p1, Lif2;->a:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lif2;->b:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p1, Lif2;->c:Lhf2;

    .line 29
    .line 30
    iput-object p1, p0, Lif2;->c:Lhf2;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a(Lre2;Ljava/lang/Object;Ldf2;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lif2;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lgf2;

    .line 8
    .line 9
    const/16 v0, 0x14

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lgf2;->a:I

    .line 14
    .line 15
    packed-switch p0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-boolean p0, p1, Lre2;->d:Z

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lho1;->k:Lyu;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lho1;

    .line 29
    .line 30
    iget p0, p0, Lho1;->j:I

    .line 31
    .line 32
    if-le p0, v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p1, Lre2;->a:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p3, p2, p0}, Ldf2;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p1, p2, p3}, Lre2;->b(Ljava/lang/Object;Ldf2;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    :pswitch_0
    return-void

    .line 44
    :cond_1
    iget-boolean p0, p1, Lre2;->d:Z

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    sget-object p0, Lho1;->k:Lyu;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lho1;

    .line 55
    .line 56
    iget p0, p0, Lho1;->j:I

    .line 57
    .line 58
    if-le p0, v0, :cond_2

    .line 59
    .line 60
    iget-object p0, p1, Lre2;->a:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p3, p2, p0}, Ldf2;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {p1, p2, p3}, Lre2;->b(Ljava/lang/Object;Ldf2;)V

    .line 67
    .line 68
    .line 69
    :goto_1
    return-void

    .line 70
    nop

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public b(Lre2;Ljava/util/Iterator;Ldf2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lif2;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lhf2;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p3}, Lhf2;->a(Lre2;Ljava/util/Iterator;Ldf2;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lif2;->c:Lhf2;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v1, p0, Lif2;->a:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0, p1, p2, p3}, Lhf2;->a(Lre2;Ljava/util/Iterator;Ldf2;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, p1, v0, p3}, Lif2;->a(Lre2;Ljava/lang/Object;Ldf2;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    return-void
.end method

.class public final Lk12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lk22;


# direct methods
.method public synthetic constructor <init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p5, p0, Lk12;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lk12;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lk12;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lk12;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Lk12;->e:Lk22;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lk12;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lk12;->d:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lk12;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lk12;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lk12;->e:Lk22;

    .line 10
    .line 11
    packed-switch v0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 15
    .line 16
    invoke-virtual {p0}, Lsa2;->V()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lsa2;->l:Ldu1;

    .line 20
    .line 21
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v3, v2, v1}, Ldu1;->n0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :pswitch_0
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 30
    .line 31
    invoke-virtual {p0}, Lsa2;->V()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lsa2;->l:Ldu1;

    .line 35
    .line 36
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v3, v2, v1}, Ldu1;->n0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :pswitch_1
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 45
    .line 46
    invoke-virtual {p0}, Lsa2;->V()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lsa2;->l:Ldu1;

    .line 50
    .line 51
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v3, v2, v1}, Ldu1;->j0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :pswitch_2
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 60
    .line 61
    invoke-virtual {p0}, Lsa2;->V()V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lsa2;->l:Ldu1;

    .line 65
    .line 66
    invoke-static {p0}, Lsa2;->T(Laa2;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v3, v2, v1}, Ldu1;->j0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    nop

    .line 75
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

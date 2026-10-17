.class public final synthetic Lhv0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Liv0;


# direct methods
.method public synthetic constructor <init>(Liv0;I)V
    .locals 0

    .line 1
    iput p2, p0, Lhv0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lhv0;->k:Liv0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lhv0;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lhv0;->k:Liv0;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Liv0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p0}, Ldl1;->j(Landroid/content/Context;)Ljv0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :pswitch_0
    iget-object p0, p0, Liv0;->e:Lgb1;

    .line 16
    .line 17
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljv0;

    .line 22
    .line 23
    iget-object p0, p0, Ljv0;->a:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

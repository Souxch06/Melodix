.class public final Lam1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lcm1;


# direct methods
.method public constructor <init>(Lcm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lam1;->j:Lcm1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object p0, p0, Lam1;->j:Lcm1;

    .line 2
    .line 3
    iget-object p0, p0, Lcm1;->i:Lpl1;

    .line 4
    .line 5
    new-instance v0, Loo;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2, v2}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lpl1;->a(Loo;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

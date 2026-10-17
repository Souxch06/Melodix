.class public final Lsr0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# instance fields
.field public final synthetic a:Lr80;

.field public final synthetic b:Lr80;

.field public final synthetic c:Lp80;

.field public final synthetic d:Lp80;


# direct methods
.method public constructor <init>(Lr80;Lr80;Lp80;Lp80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lsr0;->a:Lr80;

    .line 5
    .line 6
    iput-object p2, p0, Lsr0;->b:Lr80;

    .line 7
    .line 8
    iput-object p3, p0, Lsr0;->c:Lp80;

    .line 9
    .line 10
    iput-object p4, p0, Lsr0;->d:Lp80;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onBackCancelled()V
    .locals 0

    .line 1
    iget-object p0, p0, Lsr0;->d:Lp80;

    .line 2
    .line 3
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onBackInvoked()V
    .locals 0

    .line 1
    iget-object p0, p0, Lsr0;->c:Lp80;

    .line 2
    .line 3
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onBackProgressed(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lsf;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lsf;-><init>(Landroid/window/BackEvent;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lsr0;->b:Lr80;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final onBackStarted(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lsf;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lsf;-><init>(Landroid/window/BackEvent;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lsr0;->a:Lr80;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.class public final Lwm0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/ActionProvider$VisibilityListener;


# instance fields
.field public a:Lbv1;

.field public final b:Landroid/view/ActionProvider;


# direct methods
.method public constructor <init>(Lzm0;Landroid/view/ActionProvider;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lwm0;->b:Landroid/view/ActionProvider;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onActionProviderVisibilityChanged(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lwm0;->a:Lbv1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lvm0;

    .line 8
    .line 9
    iget-object p0, p0, Lvm0;->n:Lrm0;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lrm0;->h:Z

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrm0;->p(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.class public final Lcom/melodix/music/DiagnosticDismissListener;
.super Ljava/lang/Object;
.source "DiagnosticDismissListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final panel:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/DiagnosticDismissListener;->panel:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/DiagnosticDismissListener;->panel:Landroid/view/View;

    if-eqz v0, :done

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :done

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :done
    return-void
.end method
